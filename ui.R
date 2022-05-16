library(shiny)
library(shinythemes)
library(shinyjs)
library(shinycssloaders)
library(shinyjqui)###need to upload package to server

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title    
  tags$head(
    tags$link(rel="stylesheet", type="text/css",href="style2.css"),
   # tags$head(includeScript("google-analytics.js")),
    tags$script(type="text/javascript", src = "md5.js"),
    tags$script('!function(d,s,id){var js,fjs=d.getElementsByTagName(s)    [0],p=/^http:/.test(d.location)?\'http\':\'https\';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");')
    
  ),
  useShinyjs(),
  uiOutput("app"),
  
  
  headerPanel(
    list(tags$head(tags$style("body {background-color: white; }")),
         "  CLIMGeno V.2.0", HTML('<img src="picture2.png", height="100px",  
                        style="float:left"/>','<p style="color:orange">Climate x Genetic association GWAS browser </p>' ))
         ),
  theme = shinytheme("cerulean"),  
  
  # Sidebar with a slider input for the number of bins
  jqui_draggable( sidebarPanel(
        #    wellPanel(
        #      uiOutput("datasets")
        #    ),
        #uiOutput("ui_Manage")
        uiOutput("ui_All"),
        width=3,      
        wellPanel(a(h4('SNPfold CC:'),  h6('The SNPfold algorithm (Halvorsen et al., 2010) considers the ensemble of structures predicted by the RNA partition functions of RNAfold (Bindewald & Shapiro, 2006) for each reference and alternative sequence and quantifies structural differences between these ensembles by calculating a Pearson correlation coefficient on the base-pairing probabilities between the two sequences. The closer this correlation coefficient is to 1, the less likely it is that the RNA structure is changed by the SNP. The creators of SNPfold note (Corley et al., 2015) that for genome-wide prediction, the bottom 5% of the correlation coefficient values (corresponding in this CLIMtools dataset to a correlation coefficient of 0.445) are most likely to be riboSNitches and the top 5% of correlation coefficient values (corresponding in this CLIMtools dataset to a correlation coefficient of 0.99) are most likely to be non-riboSNitches.'))),
        wellPanel(a(h4('Please cite us in any publication that utilizes information from Arabidopsis CLIMtools:'),  h6('-Ferrero‑Serrano,Á, Sylvia, MM, Forstmeier, PC, Olson, AJ, Ware, D,Bevilacqua, PC & Assmann, SM (2021). Experimental demonstration and pan‑structurome prediction of climate‑associated riboSNitches in Arabidopsis. Under review in Genome Biology.' ), h6('-Ferrero-Serrano, Á & Assmann SM. Phenotypic and genome-wide association with the local environment of Arabidopsis. Nature Ecology & Evolution. doi: 10.1038/s41559-018-0754-5 (2019)' ))),
        wellPanel(tags$a(img(src='climgenowarning.png', h3("Considerations before using this tool"), height="120px"),href="myfile.pdf"),align="center"), wellPanel(tags$a(img(src='FDR.png', h3("Explore FDR of any ExG association"), height="120px"),href="https://rstudio.aws.science.psu.edu:3838/aaf11/FDRCLIM/"),align="center"), wellPanel(a("Tweets by @ClimTools", class="twitter-timeline"
                                , href = "https://twitter.com/ClimTools"), style = "overflow-y:scroll; max-height: 1000px"
        ),
        wellPanel( h6('Contact us: clim.tools.lab@gmail.com'),wellPanel(tags$a(div(
          img(src = 'github.png',  align = "middle"), style = "text-align: center;"
        ), href = "https://github.com/CLIMtools/CLIMGeno")))

        ###################################################
  )                 
  
),
 
                 
                 
                 ###################################################
 
  
      mainPanel( 
   tags$style(type="text/css",
                   ".shiny-output-error { visibility: hidden; }",
                   ".shiny-output-error:before { visibility: hidden; }"
        ),
        
        
          tagList( # The four core files: 3 JS files and 1 CSS file --
          #      singleton(tags$head(tags$script(src='js/highcharts.js',type='text/javascript'))),
          tags$script('!function(d,s,id){var js,fjs=d.getElementsByTagName(s)    [0],p=/^http:/.test(d.location)?\'http\':\'https\';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");'),
          singleton(tags$head(tags$script(src='/datatables/js/jquery.dataTables.js',type='text/javascript'))),
          singleton(tags$head(tags$script(src='/tabletools/js/TableTools.js',type='text/javascript'))),
          singleton(tags$head(tags$script(src='/tabletools/js/ZeroClipboard.js',type='text/javascript'))),
          singleton(tags$head(tags$link(href='/tabletools/css/TableTools.css',rel='stylesheet',type='text/css')))
          #singleton(tags$head(tags$script(src='http://code.highcharts.com/highcharts.js',type='text/javascript')))
        ),    
        
        #progressInit(),    
      wellPanel( uiOutput("ui_data_tabs"),
                 width=50,
        tableOutput('contents')
      ))
    ))
