{"cells":[{"source":"<a href=\"https://www.kaggle.com/code/zoendeloi/tarea3-tad1?scriptVersionId=148008924\" target=\"_blank\"><img align=\"left\" alt=\"Kaggle\" title=\"Open in Kaggle\" src=\"https://kaggle.com/static/images/open-in-kaggle.svg\"></a>","metadata":{},"cell_type":"markdown"},{"cell_type":"code","execution_count":1,"id":"22ff4ba5","metadata":{"execution":{"iopub.execute_input":"2023-10-25T20:31:29.180516Z","iopub.status.busy":"2023-10-25T20:31:29.178247Z","iopub.status.idle":"2023-10-25T20:31:29.454382Z","shell.execute_reply":"2023-10-25T20:31:29.452284Z"},"papermill":{"duration":0.28696,"end_time":"2023-10-25T20:31:29.457117","exception":false,"start_time":"2023-10-25T20:31:29.170157","status":"completed"},"tags":[]},"outputs":[{"data":{"text/html":["<table class=\"dataframe\">\n","<caption>A matrix: 2 × 6 of type dbl</caption>\n","<thead>\n","\t<tr><th></th><th scope=col>used</th><th scope=col>(Mb)</th><th scope=col>gc trigger</th><th scope=col>(Mb)</th><th scope=col>max used</th><th scope=col>(Mb)</th></tr>\n","</thead>\n","<tbody>\n","\t<tr><th scope=row>Ncells</th><td> 959946</td><td>51.3</td><td>1949661</td><td>104.2</td><td>1249132</td><td>66.8</td></tr>\n","\t<tr><th scope=row>Vcells</th><td>1702588</td><td>13.0</td><td>8388608</td><td> 64.0</td><td>2651364</td><td>20.3</td></tr>\n","</tbody>\n","</table>\n"],"text/latex":["A matrix: 2 × 6 of type dbl\n","\\begin{tabular}{r|llllll}\n","  & used & (Mb) & gc trigger & (Mb) & max used & (Mb)\\\\\n","\\hline\n","\tNcells &  959946 & 51.3 & 1949661 & 104.2 & 1249132 & 66.8\\\\\n","\tVcells & 1702588 & 13.0 & 8388608 &  64.0 & 2651364 & 20.3\\\\\n","\\end{tabular}\n"],"text/markdown":["\n","A matrix: 2 × 6 of type dbl\n","\n","| <!--/--> | used | (Mb) | gc trigger | (Mb) | max used | (Mb) |\n","|---|---|---|---|---|---|---|\n","| Ncells |  959946 | 51.3 | 1949661 | 104.2 | 1249132 | 66.8 |\n","| Vcells | 1702588 | 13.0 | 8388608 |  64.0 | 2651364 | 20.3 |\n","\n"],"text/plain":["       used    (Mb) gc trigger (Mb)  max used (Mb)\n","Ncells  959946 51.3 1949661    104.2 1249132  66.8\n","Vcells 1702588 13.0 8388608     64.0 2651364  20.3"]},"metadata":{},"output_type":"display_data"}],"source":["gc()\n","options(scipen=999)\n","rm(list=(ls()))"]},{"cell_type":"markdown","id":"e86f504b","metadata":{"papermill":{"duration":0.005343,"end_time":"2023-10-25T20:31:29.468515","exception":false,"start_time":"2023-10-25T20:31:29.463172","status":"completed"},"tags":[]},"source":["# **Tarea 3**\n","\n","### Taller de Análisis de Datos 1\n","\n","Mario Bravo y Enzo Loiza"]},{"cell_type":"code","execution_count":2,"id":"6f337cb6","metadata":{"execution":{"iopub.execute_input":"2023-10-25T20:31:29.51756Z","iopub.status.busy":"2023-10-25T20:31:29.481126Z","iopub.status.idle":"2023-10-25T20:31:30.902577Z","shell.execute_reply":"2023-10-25T20:31:30.900643Z"},"papermill":{"duration":1.432207,"end_time":"2023-10-25T20:31:30.905886","exception":false,"start_time":"2023-10-25T20:31:29.473679","status":"completed"},"tags":[]},"outputs":[{"name":"stderr","output_type":"stream","text":["── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n","\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.2     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n","\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.0\n","\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.2     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n","\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.2     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n","── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n","\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n","\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n","\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"]}],"source":["library(rio)      # Importar BBDD\n","library(purrr)    # Programación funcional\n","library(tidyverse)  # Aplicamos a nuestros datos \n","library(patchwork) # Compactar figuras"]},{"cell_type":"markdown","id":"ed353254","metadata":{"papermill":{"duration":0.005191,"end_time":"2023-10-25T20:31:30.916426","exception":false,"start_time":"2023-10-25T20:31:30.911235","status":"completed"},"tags":[]},"source":["Se requiere construir proceso automatizado en que lea el directorio donde se encuentran todos los datos, cargue las tablas y entregue el análisis solicitado. En concreto, se le pide que construya un solo flujo empaquetado en una función que reciba como argumento de entrada el directorio en el cual tiene sus tablas de datos. Esta función debe realizar las siguientes tareas:"]},{"cell_type":"markdown","id":"5df18070","metadata":{"papermill":{"duration":0.005136,"end_time":"2023-10-25T20:31:30.926758","exception":false,"start_time":"2023-10-25T20:31:30.921622","status":"completed"},"tags":[]},"source":["## 1. Carga de las bases a través de bucle"]},{"cell_type":"code","execution_count":3,"id":"cd6b94cf","metadata":{"execution":{"iopub.execute_input":"2023-10-25T20:31:30.941477Z","iopub.status.busy":"2023-10-25T20:31:30.939379Z","iopub.status.idle":"2023-10-25T20:31:33.199984Z","shell.execute_reply":"2023-10-25T20:31:33.197997Z"},"papermill":{"duration":2.270611,"end_time":"2023-10-25T20:31:33.202618","exception":false,"start_time":"2023-10-25T20:31:30.932007","status":"completed"},"tags":[]},"outputs":[],"source":["#carga de listas de archivos\n","archivos <- list.files(\"/kaggle/input/datapaises\",pattern = \".csv\")\n","\n","dfs <- list()\n","\n","for (i in 1:length(archivos)) {\n","    csvs <- archivos[i]\n","    data <- read.csv(file.path(\"/kaggle/input/datapaises\", csvs), sep=\",\", dec=\".\")\n","    dfs[[i]] <- data\n","}"]},{"cell_type":"markdown","id":"c15b9a74","metadata":{"papermill":{"duration":0.005217,"end_time":"2023-10-25T20:31:33.213087","exception":false,"start_time":"2023-10-25T20:31:33.20787","status":"completed"},"tags":[]},"source":["## 2. Depuración de las bases de datos"]},{"cell_type":"code","execution_count":4,"id":"29454b4d","metadata":{"execution":{"iopub.execute_input":"2023-10-25T20:31:33.228495Z","iopub.status.busy":"2023-10-25T20:31:33.226791Z","iopub.status.idle":"2023-10-25T20:31:33.258026Z","shell.execute_reply":"2023-10-25T20:31:33.256058Z"},"papermill":{"duration":0.042593,"end_time":"2023-10-25T20:31:33.260796","exception":false,"start_time":"2023-10-25T20:31:33.218203","status":"completed"},"tags":[]},"outputs":[],"source":["# a. Limpiar los nombres de las columnas para que queden en minúsculas.\n","# Hint: Revise las funciones tolower() o str_to_lower() (5 puntos).\n","\n","for (i in 1:length(dfs)) {\n","    df <- dfs[[i]]\n","    colnames(df) <- tolower(colnames(df))\n","    dfs[[i]] <- df\n","}"]},{"cell_type":"code","execution_count":5,"id":"6706c22b","metadata":{"execution":{"iopub.execute_input":"2023-10-25T20:31:33.274625Z","iopub.status.busy":"2023-10-25T20:31:33.273012Z","iopub.status.idle":"2023-10-25T20:31:35.696758Z","shell.execute_reply":"2023-10-25T20:31:35.694825Z"},"papermill":{"duration":2.434948,"end_time":"2023-10-25T20:31:35.700855","exception":false,"start_time":"2023-10-25T20:31:33.265907","status":"completed"},"tags":[]},"outputs":[],"source":["# b. Transformar las columnas Y1961 hasta Y2019 en filas, en otras palabras, se le pide transformar la tabla de formato wide a formato long.\n","# Hint: revise la función pivot_longer().\n","# La variable con los años se debe llamar year y la variable con los valores de temperatura promedio se debe llamar temperature_change (10 puntos).\n","\n","for (i in 1:length(dfs)) {\n","    df <- dfs[[i]] %>%\n","        pivot_longer(cols = -c(area, months),\n","                     names_to = \"year\",\n","                     values_to = \"temperature_change\")\n","    dfs[[i]] <- df\n","}\n"]},{"cell_type":"code","execution_count":6,"id":"9bb2270c","metadata":{"execution":{"iopub.execute_input":"2023-10-25T20:31:35.716766Z","iopub.status.busy":"2023-10-25T20:31:35.715003Z","iopub.status.idle":"2023-10-25T20:31:36.286634Z","shell.execute_reply":"2023-10-25T20:31:36.284618Z"},"papermill":{"duration":0.583634,"end_time":"2023-10-25T20:31:36.290649","exception":false,"start_time":"2023-10-25T20:31:35.707015","status":"completed"},"tags":[]},"outputs":[],"source":["# c. De la variable year generada en b debe sacar la expresión “Y” al principio de cada string.\n","# Por ejemplo, si el valor es Y1961 usted se debe quedar con 1961. Hint: revise las funciones mutate(), str_to_replace() (5 puntos).\n","\n","for (i in 1:length(dfs)) {\n","    df <- dfs[[i]] %>%\n","        mutate(year = replace(sub(\"y\", \"\", year), !startsWith(year, \"y\"), NA))\n","    dfs[[i]] <- df\n","}\n"]},{"cell_type":"code","execution_count":7,"id":"ef2391ce","metadata":{"execution":{"iopub.execute_input":"2023-10-25T20:31:36.3054Z","iopub.status.busy":"2023-10-25T20:31:36.303615Z","iopub.status.idle":"2023-10-25T20:31:36.318848Z","shell.execute_reply":"2023-10-25T20:31:36.31688Z"},"papermill":{"duration":0.026468,"end_time":"2023-10-25T20:31:36.322467","exception":false,"start_time":"2023-10-25T20:31:36.295999","status":"completed"},"tags":[]},"outputs":[],"source":["# d. A partir de la variable year generada en c y months, usted debe construir una variable nueva llamada date con la siguiente estructura:\n","# months  | year | date\n","# January | 1961 | 1961-01-15\n","# La variable date debe ser de tipo “Date”, puede verificar esto con la función class().\n","# Hint: revise la funciones mutate(), paste() y as.Date() (10 puntos).\n","\n"]},{"cell_type":"markdown","id":"403b3759","metadata":{"papermill":{"duration":0.005365,"end_time":"2023-10-25T20:31:36.333621","exception":false,"start_time":"2023-10-25T20:31:36.328256","status":"completed"},"tags":[]},"source":["## 3. Unión de bases de datos\n","\n","Una vez procesada cada tabla, debe unir por filas en un solo gran marco de datos con el nombre de df solo las tablas que tengan la información completa desde el año 1961 al 2019. Guarde su resultado final en su directorio con una extensión .csv. Por ejemplo: df_final.csv. Hint: revise las funciones `bind_rows`, add_rows, etc., además de las estructuras de control if y else para ejecutar el proceso. La función debe retornar un marco de datos final con las siguientes columnas: area, months, year, temperatura_change y date (10 puntos)."]},{"cell_type":"code","execution_count":8,"id":"a597ce29","metadata":{"execution":{"iopub.execute_input":"2023-10-25T20:31:36.348568Z","iopub.status.busy":"2023-10-25T20:31:36.346683Z","iopub.status.idle":"2023-10-25T20:31:36.362118Z","shell.execute_reply":"2023-10-25T20:31:36.359684Z"},"papermill":{"duration":0.032804,"end_time":"2023-10-25T20:31:36.371743","exception":false,"start_time":"2023-10-25T20:31:36.338939","status":"completed"},"tags":[]},"outputs":[],"source":["# exportar como .csv"]},{"cell_type":"markdown","id":"7ce3d773","metadata":{"papermill":{"duration":0.005477,"end_time":"2023-10-25T20:31:36.382584","exception":false,"start_time":"2023-10-25T20:31:36.377107","status":"completed"},"tags":[]},"source":["## 4. Missing Values\n","\n","Para los países que no tengan la información completa debe construir una tabla nueva que indique el país y el porcentaje total de missing values. Debe exportar su objeto en una tabla de excel con el nombre de: `tabla_missing.xlsx` (10 puntos)."]},{"cell_type":"code","execution_count":9,"id":"96eb425e","metadata":{"execution":{"iopub.execute_input":"2023-10-25T20:31:36.399787Z","iopub.status.busy":"2023-10-25T20:31:36.397207Z","iopub.status.idle":"2023-10-25T20:31:36.413562Z","shell.execute_reply":"2023-10-25T20:31:36.411641Z"},"papermill":{"duration":0.028501,"end_time":"2023-10-25T20:31:36.417084","exception":false,"start_time":"2023-10-25T20:31:36.388583","status":"completed"},"tags":[]},"outputs":[],"source":["# exportar como .xlsx"]}],"metadata":{"kernelspec":{"display_name":"R","language":"R","name":"ir"},"language_info":{"codemirror_mode":"r","file_extension":".r","mimetype":"text/x-r-source","name":"R","pygments_lexer":"r","version":"4.0.5"},"papermill":{"default_parameters":{},"duration":10.986513,"end_time":"2023-10-25T20:31:36.546864","environment_variables":{},"exception":null,"input_path":"__notebook__.ipynb","output_path":"__notebook__.ipynb","parameters":{},"start_time":"2023-10-25T20:31:25.560351","version":"2.4.0"}},"nbformat":4,"nbformat_minor":5}