# -*- coding: utf-8 -*-
require 'exifr'
require 'pp'

class FileelementsController < ApplicationController
  skip_before_filter :verify_authenticity_token ,:only=>[:create,:update]   # つけ忘れに注意

  # GET /fileelements
  # GET /fileelements.json
  def index
    @fileelements = Fileelement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fileelements }
    end
  end

  # GET /fileelements/1
  # GET /fileelements/1.json
  def show
    @fileelement = Fileelement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fileelement }
    end
  end

  # GET /fileelements/new
  # GET /fileelements/new.json
  def new
    @fileelement = Fileelement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fileelement }
    end
  end

  # POST /fileelements
  # POST /fileelements.json
  def create
    @fileelement = Fileelement.new(params[:fileelement])
    
    f = File.new("public/files/#{@fileelement.filename.to_s}", "w+b")
    f.write @fileelement.data
    f.close

    respond_to do |format|
      if @fileelement.save
        format.html { redirect_to @fileelement, notice: 'Fileelement was successfully created.' }
        format.json { render json: @fileelement, status: :created, location: @fileelement }
      else
        format.html { render action: "new" }
        format.json { render json: @fileelement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fileelements/1
  # PUT /fileelements/1.json
  def create
    f = params[:fileelement]
    @fileelement = Fileelement.new
    @fileelement.filename = f.original_filename
    @fileelement.content_type = f.content_type
    @fileelement.data = f.read
    
    path = "public/files/#{@fileelement.filename.to_s}"
    f = File.new(path, "w+b")
    f.write @fileelement.data
    f.close
    
    exif = EXIFR::JPEG.new(path)
    print "カメラ: ", exif.make, ", Model: ", exif.model, "\n"

pp @fileelement

    @fileelement.make = exif.make
pp @fileelement
    @fileelement.model = exif.model
pp @fileelement
         
    respond_to do |format|
      if @fileelement.save
        format.html { redirect_to(@fileelement, :notice => 'Fileelement was successfully created.') }
        format.xml  { render :xml => @fileelement, :status => :created, :location => @fileelement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fileelement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fileelements/1
  # DELETE /fileelements/1.json
  def destroy
    @fileelement = Fileelement.find(params[:id])
    @fileelement.destroy

    respond_to do |format|
      format.html { redirect_to fileelements_url }
      format.json { head :no_content }
    end
  end

  def viewer
    @fileelement = Fileelement.find(params[:id])
    send_data(@fileelement.data,
              :filename => @fileelement.filename, 
              :content_type => @fileelement.content_type,
              :disposition => 'inline')
  end

  def downloadfile
    @fileelement = Fileelement.find(params[:id])
    send_data(@fileelement.data,
              :filename => @fileelement.filename, 
              :content_type => @fileelement.content_type)
  end
end
