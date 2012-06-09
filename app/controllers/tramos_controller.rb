class TramosController < ApplicationController
  # GET /tramos
  # GET /tramos.xml
  def index
    @tramos = Tramo.where(:proyecto_id=>params[:proyecto_id])
    @proyecto_id = params[:proyecto_id]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tramos }
    end
  end

  def calctramos
    calcula_tramos(params[:proyecto_id].to_i)
    @tramos = Tramo.where(:proyecto_id=>params[:proyecto_id])
    @proyecto_id = params[:proyecto_id]

    respond_to do |format|
      format.html {render :index}
      format.xml  { render :xml => @tramos }
    end    
  end
  
  #divide la linea en tramos y tipos de piquetes
  def calcula_tramos(proyecto_id)
    proyecto = Proyecto.find(params[:proyecto_id].to_i) 
    dretmax = proyecto.dretmax
    vanomax = proyecto.vanomax
    pant = nil
    tant = nil
    
    Tramo.where(:proyecto_id => proyecto_id).each {|t|
      t.reltramovanos.destroy_all
      t.destroy
    }      
    Vano.where(:proyecto_id => proyecto_id).destroy_all
    
    puntos = Punto.where(:proyecto_id => proyecto_id).order(:secuencia)
    n = 0
    m = puntos.count-1
    
    puntos.each {|p|
      if (n==0)
        tramo = Tramo.new
        tramo.ttramo_id = 1 #arranque
        tramo.cantidad = 1
        tramo.secuencia = Tramo.where(:proyecto_id =>proyecto_id).maximum(:secuencia).to_i+10
        tramo.nombre = "Arranque en " + p.punto
        tramo.proyecto_id = proyecto_id
        tramo.save
        tant = tramo
        
      elsif (n<m) #desvios intermedios
        vano = Vano.new
        vano.nombre = "Vanos entre " + pant.punto + ' y ' + p.punto
        if (p.distancia < vanomax)
          vano.vano = p.distancia
        else
          vano.vano = p.distancia / (( p.distancia/vanomax).to_i + 1 )
        end 
        vano.proyecto_id = proyecto_id
        vano.cond_e_id = proyecto.cond_e_id
        vano.cond_g_id = proyecto.cond_g_id
        vano.save
        vano.calcvano
        vant = vano
        
        if (p.distancia > dretmax)
          tramo = Tramo.new
          tramo.ttramo_id = 4 #retension
          tramo.cantidad = (p.distancia/dretmax).to_i
          tramo.secuencia = Tramo.where(:proyecto_id =>proyecto_id).maximum(:secuencia).to_i+10
          tramo.nombre = "Retensiones entre " + pant.punto + ' y ' + p.punto
          tramo.proyecto_id = proyecto_id
          tramo.save
          rel = Reltramovano.new
          rel.vano_id = vano.id
          rel.tramo_id = tramo.id
          rel.angulo = 0
          rel.save
        end
        if (p.distancia > vanomax)
          tramo = Tramo.new
          tramo.ttramo_id = 5 #alineacion
          tramo.cantidad =(p.distancia/vanomax).to_i - (p.distancia/dretmax).to_i
          tramo.secuencia = Tramo.where(:proyecto_id =>proyecto_id).maximum(:secuencia).to_i+10
          tramo.nombre = "Alineaciones entre " + pant.punto + ' y ' + p.punto
          tramo.proyecto_id = proyecto_id
          tramo.save
          rel = Reltramovano.new
          rel.vano_id = vano.id
          rel.tramo_id = tramo.id
          rel.angulo = 0
          rel.save
        end
        tramo = Tramo.new
        tramo.ttramo_id = 2 #desvio
        tramo.cantidad = 1
        tramo.secuencia = Tramo.where(:proyecto_id =>proyecto_id).maximum(:secuencia).to_i+10
        tramo.nombre = "Desvio de " + p.angulo.to_i.to_s + "° en " + p.punto
        tramo.proyecto_id = proyecto_id
        tramo.save
        rel = Reltramovano.new
        rel.vano_id = vano.id
        rel.tramo_id = tramo.id
        rel.angulo = 0
        rel.save
        rel = Reltramovano.new
        rel.vano_id = vano.id
        rel.tramo_id = tant.id
        rel.angulo = pant.angulo
        rel.save
        tant = tramo
        
      else #terminal
        vano = Vano.new
        vano.nombre = "Vanos entre " + pant.punto + ' y ' + p.punto 
        if (p.distancia < vanomax)
          vano.vano = p.distancia
        else
          vano.vano = p.distancia / (( p.distancia/vanomax).to_i + 1 )
        end 
        vano.proyecto_id = proyecto_id
        vano.cond_e_id = proyecto.cond_e_id
        vano.cond_g_id = proyecto.cond_g_id
        vano.save
        vano.calcvano

        if (p.distancia > dretmax)
          tramo = Tramo.new
          tramo.ttramo_id = 4 #retension
          tramo.cantidad = (p.distancia/dretmax).to_i
          tramo.secuencia = Tramo.where(:proyecto_id =>proyecto_id).maximum(:secuencia).to_i+10
          tramo.nombre = "Retensiones entre " + pant.punto + ' y ' + p.punto
          tramo.proyecto_id = proyecto_id
          tramo.save
          rel = Reltramovano.new
          rel.vano_id = vano.id
          rel.tramo_id = tramo.id
          rel.angulo = 0
          rel.save
        end
        if (p.distancia > vanomax)
          tramo = Tramo.new
          tramo.ttramo_id = 5 #alineacion
          tramo.cantidad =(p.distancia/vanomax).to_i - (p.distancia/dretmax).to_i
          tramo.secuencia = Tramo.where(:proyecto_id =>proyecto_id).maximum(:secuencia).to_i+10
          tramo.nombre = "Alineaciones entre " + pant.punto + ' y ' + p.punto
          tramo.proyecto_id = proyecto_id
          tramo.save
          rel = Reltramovano.new
          rel.vano_id = vano.id
          rel.tramo_id = tramo.id
          rel.angulo = 0
          rel.save
        end
        tramo = Tramo.new
        tramo.ttramo_id = 3 #terminal
        tramo.cantidad = 1
        tramo.secuencia = Tramo.where(:proyecto_id =>proyecto_id).maximum(:secuencia).to_i+10
        tramo.nombre = "Terminal en " + p.punto
        tramo.proyecto_id = proyecto_id
        tramo.save
        rel = Reltramovano.new
        rel.vano_id = vano.id
        rel.tramo_id = tramo.id
        rel.angulo = p.angulo
        rel.save
        rel = Reltramovano.new
        rel.vano_id = vano.id
        rel.tramo_id = tant.id
        rel.angulo = pant.angulo
        rel.save
        
      end
      
      n+=1
      pant = p
    }
    
    Tramo.where(:proyecto_id=>proyecto_id).each { |t|
        t.calcabezal
    }
  end
  
  
  # GET /tramos/1
  # GET /tramos/1.xml
  def show
    @tramo = Tramo.find(params[:id])
    @proyecto_id = params[:proyecto_id]
    @vanos = @tramo.vanos

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tramo }
    end
  end

  # GET /tramos/new
  # GET /tramos/new.xml
  def new
    @tramo = Tramo.new
    @proyecto_id = params[:proyecto_id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tramo }
    end
  end

  # GET /tramos/1/edit
  def edit
    @tramo = Tramo.find(params[:id])
    @proyecto_id = params[:proyecto_id]
  end

  # POST /tramos
  # POST /tramos.xml
  def create
    @tramo = Tramo.new(params[:tramo])

    respond_to do |format|
      if @tramo.save
        format.html { redirect_to(@tramo, :notice => 'Tramo was successfully created.') }
        format.xml  { render :xml => @tramo, :status => :created, :location => @tramo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tramo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tramos/1
  # PUT /tramos/1.xml
  def update
    @tramo = Tramo.find(params[:id])

    respond_to do |format|
      if @tramo.update_attributes(params[:tramo])
        format.html { redirect_to(@tramo, :notice => 'Tramo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tramo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tramos/1
  # DELETE /tramos/1.xml
  def destroy
    @tramo = Tramo.find(params[:id])
    @proyecto_id = @tramo.proyecto_id
    @tramo.destroy

    respond_to do |format|
      format.html { redirect_to(:action=>'index',:proyecto_id=>@proyecto_id) }
      format.xml  { head :ok }
    end
  end
end
