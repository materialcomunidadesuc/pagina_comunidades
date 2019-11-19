class TemplatesController < ApplicationController
  before_action :set_template, only: [:show, :edit, :update, :destroy]

  # GET /templates
  # GET /templates.json
  def index
    @templates = Template.all
  end

  # GET /templates/1
  # GET /templates/1.json
  def show
  end

  # GET /templates/new
  def new
    @template = Template.new
    @template.structure = "Todas las oraciones y motivaciones están en letra \\italica{cursivas}. Estas son leídas en voz alta, el resto son instrucciones para el guía de cada grupo.

Antes de partir la celebración el dueño de casa puede preparar el lugar armando un pequeño altar. Este consta de tres signos: \\negrita{mantel}, signo con el que destacamos la mesa que vamos a usar como altar, convirtiendo este espacio en un lugar sagrado; \\negrita{cruz}, signo de vida, del misterio de la fe cristiana: por la muerte se encuentra la vida... Jesús murió, pero resucitó, esta vivo entre nosotros y nos habla; y \\negrita{cirio}, signo de la presencia entre nosotros de Cristo Resucitado por medio del Espíritu Santo, es la luz de Cristo que nos ilumina."
    @template.initial_prayer = "Nos persignamos e invocamos al Espíritu Santo para que nos ilumine y guíe durante la reflexión que vamos a tener.

\\italica{\“Ven Espíritu Santo, llena los corazones de tus fieles y abrázalos en el fuego de tu amor. Envía Señor tu Espíritu y todas las cosas serán creadas.
R: Y renovarás la faz de la tierra.\”}"

    @template.motivation = "Es recomendable que el guía de cada grupo prepare su propia motivación a escuchar el Evangelio, pero en caso de no hacerlo puede leer una preparada. Si decide prepararla, es importante recalcar que la motivación no debe ser demasiado larga, ni muy explicativa. La idea es que una vez hecha la motivación los que participan de la liturgia quieran escuchar la lectura. Es como si estuviesen invitándolos a comer un plato muy rico, no les describirían los ingredientes del plato, sino que darían razones para comerlo.

\\hfill \\\\ \\hfill
\'¡Motivación!\'
\\hfill \\\\ \\hfill
    
Se puede dejar un rato de silencio antes de leer el Evangelio para entrar con la mente limpia y sin preocupaciones.
    
\\newpage"
    
    @template.gospel = "Puede imprimirse el Evangelio (si no tienen Biblias) y cada uno seguir la lectura desde su papel. \\href{¡link!}{\\color{amarillo}Evangelio para imprimir}
\\hfill \\\\ \\hfill
    
\\italica{Lectura del santo evangelio según san X (a, b-c):}
\\hfill \\\\ \\hfill
    
\\negritaitalica{\"
\\textsuperscript{a}Bla bla 
\\textsuperscript{b}bla bla.
\"}

\\hfill \\\\ \\hfill
    
\\italica{Palabra del Señor. R: Gloria a ti Señor Jesús}"
    @template.activities = "Meditar es masticar, rumiar, repetir, reflexionar, recordar. Es dentro de ese ejercicio que la meditación busca en primer lugar reconocer a la persona de Jesucristo en la lectura para luego descubrir lo que Él me quiera decir a mí, aquí y ahora, a través de ella. La pregunta que busca responder la meditación es \“¿qué me dice el Señor?\”. Para esto cada guía de comunidad puede proponer su propia actividad, sin embargo algunas sugeridas son:

\\begin{enumerate}
  \\item 
\\end{enumerate}
    
Si quieren pueden mezclar estas actividades, elegir algunas, o inventar otra nueva. Este espacio está muy abierto a la creatividad del guía.  
Terminamos rezando un Padre Nuestro y poniendo en común algunas intenciones."
    
    @template.final_prayer = "\\italica{\“Querido Jesús, te agradecemos por esta reflexión. Te pedimos que a través de tu ejemplo en el Evangelio, nos enseñes a amar como Tú lo hiciste y a ser jóvenes que viven Tu palabra. Que nuestra vida sea un constante caminar en la fe para que podamos conocer a Dios y que, como San Cristóbal, podamos ser portadores tuyos con nuestros amigos y en nuestras familias. Amén\”}"

    @template.calendar = "\\negrita{Lunes:}

\\negrita{Martes:}

\\negrita{Miercoles:}

\\negrita{Jueves:}

\\negrita{Viernes:}

\\negrita{Sabado:}

\\negrita{Domingo:}"
  end

  # GET /templates/1/edit
  def edit
  end

  def save
    directory_name = @template.name
    Dir.mkdir(directory_name) unless File.exists?(directory_name)

    path = directory_name + "/1_estructura.tex"
    content = @template.structure
    File.open(path, "w+") do |f|
      f.write(content)
    end

    path = directory_name + "/2_oracion_inicial.tex"
    content = @template.initial_prayer
    File.open(path, "w+") do |f|
      f.write(content)
    end

    path = directory_name + "/3_motivacion.tex"
    content = @template.motivation
    File.open(path, "w+") do |f|
      f.write(content)
    end

    path = directory_name + "/4_evangelio.tex"
    content = @template.gospel
    File.open(path, "w+") do |f|
      f.write(content)
    end

    path = directory_name + "/5_actividades.tex"
    content = @template.activities
    File.open(path, "w+") do |f|
      f.write(content)
    end

    path = directory_name + "/6_proposito.tex"
    content = @template.purpose
    File.open(path, "w+") do |f|
      f.write(content)
    end

    path = directory_name + "/7_oracion_final.tex"
    content = @template.final_prayer
    File.open(path, "w+") do |f|
      f.write(content)
    end

    path = directory_name + "/8_anexos.tex"
    content = @template.annexed
    File.open(path, "w+") do |f|
      f.write(content)
    end

    path = directory_name + "/9_calendario.tex"
    content = @template.calendar
    File.open(path, "w+") do |f|
      f.write(content)
    end

    path = @template.name + ".tex"
    content = "\\documentclass[letter,14pt]{extarticle}
\\usepackage[utf8]{inputenc}
\\usepackage{fontspec}
\\usepackage{xcolor}
\\usepackage{draftwatermark}
\\usepackage[margin=0.5in]{geometry}
\\usepackage{tikz}
\\usetikzlibrary{calc}
\\usepackage{eso-pic}
\\usepackage{tabularx}
\\usepackage{graphicx}
\\usepackage{hyperref}
\\usepackage[T1]{fontenc}
\\AddToShipoutPictureBG{%
\\begin{tikzpicture}[overlay,remember picture]
\\color{amarillo}
\\draw[line width=14pt]
    ($ (current page.north west) + (0.05cm,-0.1cm) $)
    rectangle
    ($ (current page.south east) + (-0.15cm,0.15cm) $);
\\end{tikzpicture}
}

\\setmainfont[Ligatures=TeX]{Montserrat-Light.ttf}
\\newfontfamily\\normalfont[Ligatures=TeX]{Montserrat-Light.ttf}
\\newfontfamily\\italicafont[Ligatures=TeX]{Montserrat-LightItalic.ttf}
\\newfontfamily\\mediumfont[Ligatures=TeX]{Montserrat-Medium.ttf}
\\newfontfamily\\negritafont[Ligatures=TeX]{Montserrat-Regular.ttf}
\\newfontfamily\\negritaitalicafont[Ligatures=TeX]{Montserrat-Italic.ttf}
\\newfontfamily\\longreachfont[Ligatures=TeX]{Longreach.otf}

\\DeclareTextFontCommand{\\normal}{\\normalfont}
\\DeclareTextFontCommand{\\italica}{\\italicafont}
\\DeclareTextFontCommand{\\medium}{\\mediumfont}
\\DeclareTextFontCommand{\\negrita}{\\negritafont}
\\DeclareTextFontCommand{\\negritaitalica}{\\negritaitalicafont}
\\DeclareTextFontCommand{\\longreach}{\\longreachfont}

\\renewcommand{\\thefootnote}{\\fnsymbol{footnote}}

\\usepackage{etoolbox}

\\newcommand{\\footnotetextnumbering}{\\alph{footnote}}
\\makeatletter
\\patchcmd{\\footnote}% <cmd>
  {\\@footnotemark}% <search>
  {\\protected@xdef\\@thefntextmark{\\footnotetextnumbering}%
    \\@footnotemark}% <replace>
  {}{}% <success><failure>
\\def\\@makefntextmark{\\hbox{\\@textsuperscript{\\normalfont\\@thefntextmark}}}
\\patchcmd{\\@makefntext}{\\@makefnmark}{\\@makefntextmark}{}{}
\\makeatother


\\definecolor{amarillo}{RGB}{245,184,12}
\\pagenumbering{gobble}
\\setlength{\\arrayrulewidth}{4pt}

\\SetWatermarkText{\\includegraphics[angle=-45]{Logo.png}}
\\SetWatermarkScale{0.7}
\\SetWatermarkLightness{1}

\\usepackage[spanish]{babel}
\\usepackage[spanish]{translator}    

\\deftranslation[to=spanish]{January}{Enero}
\\deftranslation[to=spanish]{February}{Febrero}
\\deftranslation[to=spanish]{March}{Marzo}
\\deftranslation[to=spanish]{April}{Abril}
\\deftranslation[to=spanish]{May}{Mayo}
\\deftranslation[to=spanish]{June}{Junio}
\\deftranslation[to=spanish]{July}{Julio}
\\deftranslation[to=spanish]{August}{Agosto}
\\deftranslation[to=spanish]{September}{Septiembre}
\\deftranslation[to=spanish]{October}{Octubre}
\\deftranslation[to=spanish]{November}{Noviembre}
\\deftranslation[to=spanish]{December}{Diciembre}
\\deftranslation[to=spanish]{Mon}{Lun}
\\deftranslation[to=spanish]{Tue}{Mar}
\\deftranslation[to=spanish]{Wed}{Mié}
\\deftranslation[to=spanish]{Thu}{Jue}
\\deftranslation[to=spanish]{Fri}{Vie}
\\deftranslation[to=spanish]{Sat}{Sab}
\\deftranslation[to=spanish]{Sun}{Dom}

\\usetikzlibrary{calc}
\\usetikzlibrary{calendar}
% \\renewcommand*\\familydefault{\\sfdefault}

% User defined

\\begin{document}

\\pagecolor{white}

\\begin{center}
    \\fontsize{50}{60}\\selectfont {\\color{amarillo}\\longreach{Pauta guía de comunidad}}
\\end{center}

\\hfill \\\\ \\hfill
{\\medium{Estructura}}
{\\color{amarillo} \\vspace{4pt} \\hrule height 4pt }
\\hfill \\\\ \\hfill
\\normal{\\input{" + @template.name + "/1_estructura.tex}}

\\hfill \\\\ \\hfill
{\\medium{Oración Inicial}}
{\\color{amarillo} \\vspace{4pt} \\hrule height 4pt }
\\hfill \\\\ \\hfill
\\normal{\\input{" + @template.name + "/2_oracion_inicial.tex}}

\\hfill \\\\ \\hfill
{\\medium{Motivación al Evangelio}}
{\\color{amarillo} \\vspace{4pt} \\hrule height 4pt }
\\hfill \\\\ \\hfill
\\normal{\\input{" + @template.name + "/3_motivacion.tex}}

\\newpage
{\\noindent \\medium{Evangelio}}
{\\color{amarillo} \\vspace{4pt} \\hrule height 4pt }
\\hfill \\\\ \\hfill
\\normal{\\input{" + @template.name + "/4_evangelio.tex}}

\\hfill \\\\ \\hfill
{\\medium{Actividades}}
{\\color{amarillo} \\vspace{4pt} \\hrule height 4pt }
\\hfill \\\\ \\hfill
\\normal{\\input{" + @template.name + "/5_actividades.tex}}

\\hfill \\\\ \\hfill
{\\medium{Propósito Comunitario}}
{\\color{amarillo} \\vspace{4pt} \\hrule height 4pt }
\\hfill \\\\ \\hfill
\\normal{\\input{" + @template.name + "/6_proposito.tex}}

\\hfill \\\\ \\hfill
{\\medium{Oración Final}}
{\\color{amarillo} \\vspace{4pt} \\hrule height 4pt }
\\hfill \\\\ \\hfill
\\normal{\\input{" + @template.name + "/7_oracion_final.tex}}

\\newpage
\\begin{center}
    \\fontsize{50}{60}\\selectfont {\\color{amarillo}\\longreach{Anexos}}
\\end{center}
% \\hfill \\\\ \\hfill
\\normal{\\input{" + @template.name + "/8_anexos.tex}}

\\def\\iyear{" + @template.initial_year.to_s + "} % Año de inicio
\\def\\fyear{" + @template.final_year.to_s + "} % Año de fin
\\def\\imonth{" + @template.initial_month.to_s + "} % Mes de inicio
\\def\\iday{" + @template.initial_day.to_s + "} % Día de inicio
\\def\\fmonth{" + @template.final_month.to_s + "} % Mes de fin
\\def\\fday{" + @template.final_day.to_s + "} % Día de fin

\\def\\lunes{" + @template.monday_gospel + "\\\\" + @template.monday_saints + "} % Lo que va el día lunes
\\def\\martes{" + @template.tuesday_gospel + "\\\\" + @template.tuesday_saints + "} % Lo que va el día martes
\\def\\miercoles{" + @template.wednesday_gospel + "\\\\" + @template.wednesday_saints + "} % Lo que va el día miércoles
\\def\\jueves{" + @template.thursday_gospel + "\\\\" + @template.thursday_saints + "} % Lo que va el día jueves
\\def\\viernes{" + @template.friday_gospel + "\\\\" + @template.friday_saints + "} % Lo que va el día viernes
\\def\\sabado{" + @template.saturday_gospel + "\\\\" + @template.saturday_saints + "} % Lo que va el día sábado
\\def\\domingo{" + @template.sunday_gospel + "\\\\" + @template.sunday_saints + "} % Lo que va el día domingo

\\hfill \\\\ \hfill
{\\medium{Esta semana}}
{\\color{amarillo} \\vspace{4pt} \\hrule height 4pt }
\\hfill \\\\ \\hfill
\\normal{\\input{" + @template.name + "/9_calendario.tex}}

\\begin{center}
\\hspace*{-0.5cm}
\\begin{tikzpicture}[every day/.style={anchor = north}, font=\\fontsize{12}{15}\\selectfont]
\\calendar[
  dates=\\iyear-\\imonth-\\iday to \\fyear-\\fmonth-\\fday,
%   dates=\\iyear-10-07 to \\fyear-10-13,
  name=cal,
  day yshift = 3em,
  day code=
  {
    \\node[name=\\pgfcalendarsuggestedname,every day,shape=rectangle,
    minimum height= 2.3cm, text width = 2.3cm, draw = gray, text depth = 2.4 cm]{
    \\ifdate{Monday}{\\normal{\lunes}}{}\\ifdate{Tuesday}{\\normal{\\martes}}{}\\ifdate{Wednesday}{\\normal{\\miercoles}}{}\\ifdate{Thursday}{\\normal{\\jueves}}{}\\ifdate{Friday}{\\normal{\\viernes}}{}\\ifdate{Saturday}{\\normal{\\sabado}}{}\\ifdate{Sunday}{\\normal{\\domingo}}{}};
    \\draw (-1.8cm, -.1ex) node[anchor = west]{};
  },
  execute before day scope=
  {
    \\ifdate{workday}
    {
      % Shift right
      \\tikzset{every day/.style={fill=white}}
      \\pgftransformxshift{2.6cm}
      % Print month name 
      \\draw (0,0)node [shape=rectangle, minimum height= .53cm,
        text width = 2.3cm, fill = amarillo, text= black, draw = amarillo, text centered]
        {\\fontsize{12}{15}\\selectfont\\negritafont\\pgfcalendarweekdayshortname{\\pgfcalendarcurrentweekday} \\tikzdaytext};
    }{}
    \\ifdate{Saturday}{
      % Shift right
      \\pgftransformxshift{2.6cm}
      % Print month name 
      \\draw (0,0)node [shape=rectangle, minimum height= .53cm,
        text width = 2.3cm, fill = amarillo, text= black, draw = amarillo, text centered]
        {\\fontsize{12}{15}\\selectfont\\negritafont\\pgfcalendarweekdayshortname{\\pgfcalendarcurrentweekday} \\tikzdaytext};
    \\tikzset{every day/.style={fill=amarillo!10}}}{}
    \\ifdate{Sunday}{
      % Shift right
      \\pgftransformxshift{2.6cm}
      % Print month name 
      \\draw (0,0)node [shape=rectangle, minimum height= .53cm,
        text width = 2.3cm, fill = amarillo, text= black, draw = amarillo, text centered]
        {\\fontsize{12}{15}\\selectfont\\negritafont\\pgfcalendarweekdayshortname{\\pgfcalendarcurrentweekday} \\tikzdaytext};
    \\tikzset{every day/.style={fill=amarillo!20}}}{}
  },
  execute at begin day scope=
  {
    % each day is shifted down according to the day of month
    \\pgftransformyshift{-1.8 cm}
  }
];
\\end{tikzpicture}

\\end{center}

\\end{document}"
    File.open(path, "w+") do |f|
      f.write(content)
    end
  end
  # POST /templates
  # POST /templates.json
  def create
    @template = Template.new(template_params)

    respond_to do |format|
      if @template.save
        format.html { redirect_to @template, notice: 'Template was successfully created.' }
        format.json { render :show, status: :created, location: @template }
      else
        format.html { render :new }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end

    save()

  end

  # PATCH/PUT /templates/1
  # PATCH/PUT /templates/1.json
  def update
    
    respond_to do |format|
      if @template.update(template_params)
        format.html { redirect_to @template, notice: 'Template was successfully updated.' }
        format.json { render :show, status: :ok, location: @template }
      else
        format.html { render :edit }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end

    save()
    
  end

  # DELETE /templates/1
  # DELETE /templates/1.json
  def destroy
    @template.destroy
    respond_to do |format|
      format.html { redirect_to templates_url, notice: 'Template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template
      @template = Template.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_params
      params.require(:template).permit(:name, :structure, :initial_prayer, :motivation, :gospel, :activities, :purpose, :final_prayer, :annexed, :calendar, :initial_year, :initial_month, :initial_day, :final_year, :final_month, :final_day, :monday_gospel, :monday_saints, :tuesday_gospel, :tuesday_saints, :wednesday_gospel, :wednesday_saints, :thursday_gospel, :thursday_saints, :friday_gospel, :friday_saints, :saturday_gospel, :saturday_saints, :sunday_gospel, :sunday_saints)
    end
end
