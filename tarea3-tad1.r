{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "288724cb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T21:15:43.099147Z",
     "iopub.status.busy": "2023-10-24T21:15:43.096983Z",
     "iopub.status.idle": "2023-10-24T21:15:43.359711Z",
     "shell.execute_reply": "2023-10-24T21:15:43.357915Z"
    },
    "papermill": {
     "duration": 0.273283,
     "end_time": "2023-10-24T21:15:43.362759",
     "exception": false,
     "start_time": "2023-10-24T21:15:43.089476",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 2 × 6 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>used</th><th scope=col>(Mb)</th><th scope=col>gc trigger</th><th scope=col>(Mb)</th><th scope=col>max used</th><th scope=col>(Mb)</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>Ncells</th><td> 959946</td><td>51.3</td><td>1949661</td><td>104.2</td><td>1249132</td><td>66.8</td></tr>\n",
       "\t<tr><th scope=row>Vcells</th><td>1702588</td><td>13.0</td><td>8388608</td><td> 64.0</td><td>2651364</td><td>20.3</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 2 × 6 of type dbl\n",
       "\\begin{tabular}{r|llllll}\n",
       "  & used & (Mb) & gc trigger & (Mb) & max used & (Mb)\\\\\n",
       "\\hline\n",
       "\tNcells &  959946 & 51.3 & 1949661 & 104.2 & 1249132 & 66.8\\\\\n",
       "\tVcells & 1702588 & 13.0 & 8388608 &  64.0 & 2651364 & 20.3\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 2 × 6 of type dbl\n",
       "\n",
       "| <!--/--> | used | (Mb) | gc trigger | (Mb) | max used | (Mb) |\n",
       "|---|---|---|---|---|---|---|\n",
       "| Ncells |  959946 | 51.3 | 1949661 | 104.2 | 1249132 | 66.8 |\n",
       "| Vcells | 1702588 | 13.0 | 8388608 |  64.0 | 2651364 | 20.3 |\n",
       "\n"
      ],
      "text/plain": [
       "       used    (Mb) gc trigger (Mb)  max used (Mb)\n",
       "Ncells  959946 51.3 1949661    104.2 1249132  66.8\n",
       "Vcells 1702588 13.0 8388608     64.0 2651364  20.3"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "gc()\n",
    "options(scipen=999)\n",
    "rm(list=(ls()))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ae4ddb2d",
   "metadata": {
    "papermill": {
     "duration": 0.003681,
     "end_time": "2023-10-24T21:15:43.370353",
     "exception": false,
     "start_time": "2023-10-24T21:15:43.366672",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Tarea 3**\n",
    "\n",
    "### Taller de Análisis de Datos 1\n",
    "\n",
    "Mario Bravo y Enzo Loiza"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "43f7eb73",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T21:15:43.409170Z",
     "iopub.status.busy": "2023-10-24T21:15:43.379664Z",
     "iopub.status.idle": "2023-10-24T21:15:44.280983Z",
     "shell.execute_reply": "2023-10-24T21:15:44.279251Z"
    },
    "papermill": {
     "duration": 0.910029,
     "end_time": "2023-10-24T21:15:44.284188",
     "exception": false,
     "start_time": "2023-10-24T21:15:43.374159",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘dplyr’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:stats’:\n",
      "\n",
      "    filter, lag\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    intersect, setdiff, setequal, union\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(rio)      # Importar BBDD\n",
    "library(dplyr)    # Manipulación de datos\n",
    "library(purrr)    # Programación funcional\n",
    "library(ggplot2)  # Aplicamos a nuestros datos \n",
    "library(patchwork) # Compactar figuras\n",
    "library(tidyr)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f94bc32c",
   "metadata": {
    "papermill": {
     "duration": 0.00395,
     "end_time": "2023-10-24T21:15:44.292213",
     "exception": false,
     "start_time": "2023-10-24T21:15:44.288263",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Se requiere construir proceso automatizado en que lea el directorio donde se encuentran todos los datos, cargue las tablas y entregue el análisis solicitado. En concreto, se le pide que construya un solo flujo empaquetado en una función que reciba como argumento de entrada el directorio en el cual tiene sus tablas de datos. Esta función debe realizar las siguientes tareas:"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "30de7e2e",
   "metadata": {
    "papermill": {
     "duration": 0.003943,
     "end_time": "2023-10-24T21:15:44.300339",
     "exception": false,
     "start_time": "2023-10-24T21:15:44.296396",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 1. Carga de las bases a través de bucle"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "8d4489b5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T21:15:44.312353Z",
     "iopub.status.busy": "2023-10-24T21:15:44.310161Z",
     "iopub.status.idle": "2023-10-24T21:15:46.099770Z",
     "shell.execute_reply": "2023-10-24T21:15:46.097724Z"
    },
    "papermill": {
     "duration": 1.798718,
     "end_time": "2023-10-24T21:15:46.103003",
     "exception": false,
     "start_time": "2023-10-24T21:15:44.304285",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#carga de listas de archivos\n",
    "archivos <- list.files(\"/kaggle/input/datapaises\",pattern = \".csv\")\n",
    "\n",
    "dfs <- list()\n",
    "\n",
    "for (i in 1:length(archivos)) {\n",
    "    csvs <- archivos[i]\n",
    "    data <- read.csv(file.path(\"/kaggle/input/datapaises\", csvs), sep=\",\", dec=\".\")\n",
    "    dfs[[i]] <- data\n",
    "}"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "70e229be",
   "metadata": {
    "papermill": {
     "duration": 0.005478,
     "end_time": "2023-10-24T21:15:46.112524",
     "exception": false,
     "start_time": "2023-10-24T21:15:46.107046",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 2. Deuración de las bases de datos"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "8e141a40",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T21:15:46.124510Z",
     "iopub.status.busy": "2023-10-24T21:15:46.122857Z",
     "iopub.status.idle": "2023-10-24T21:15:46.153348Z",
     "shell.execute_reply": "2023-10-24T21:15:46.151451Z"
    },
    "papermill": {
     "duration": 0.039857,
     "end_time": "2023-10-24T21:15:46.156723",
     "exception": false,
     "start_time": "2023-10-24T21:15:46.116866",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# a. Limpiar los nombres de las columnas para que queden en minúsculas. Hint: Revise las funciones tolower() o str_to_lower() (5 puntos).\n",
    "\n",
    "for (i in 1:length(dfs)) {\n",
    "    df <- dfs[[i]]\n",
    "    colnames(df) <- tolower(colnames(df))\n",
    "    dfs[[i]] <- df\n",
    "}"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "ce401bde",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T21:15:46.168710Z",
     "iopub.status.busy": "2023-10-24T21:15:46.167034Z",
     "iopub.status.idle": "2023-10-24T21:15:48.236477Z",
     "shell.execute_reply": "2023-10-24T21:15:48.234354Z"
    },
    "papermill": {
     "duration": 2.078085,
     "end_time": "2023-10-24T21:15:48.238813",
     "exception": false,
     "start_time": "2023-10-24T21:15:46.160728",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# b. Transformar las columnas Y1961 hasta Y2019 en filas, en otras palabras, se le pide transformar la tabla de formato wide a formato long.\n",
    "# Hint: revise la función pivot_longer().\n",
    "# La variable con los años se debe llamar year y la variable con los valores de temperatura promedio se debe llamar temperature_change (10 puntos).\n",
    "\n",
    "for (i in 1:length(dfs)) {\n",
    "    df <- dfs[[i]] %>%\n",
    "        pivot_longer(cols = -c(area, months),\n",
    "                     names_to = \"year\",\n",
    "                     values_to = \"temperature_change\")\n",
    "    \n",
    "    dfs[[i]] <- df\n",
    "}\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "e0cf4f2b",
   "metadata": {
    "papermill": {
     "duration": 0.003963,
     "end_time": "2023-10-24T21:15:48.247919",
     "exception": false,
     "start_time": "2023-10-24T21:15:48.243956",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "6150dc1a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T21:15:48.259491Z",
     "iopub.status.busy": "2023-10-24T21:15:48.257951Z",
     "iopub.status.idle": "2023-10-24T21:15:48.275506Z",
     "shell.execute_reply": "2023-10-24T21:15:48.273779Z"
    },
    "papermill": {
     "duration": 0.025743,
     "end_time": "2023-10-24T21:15:48.277855",
     "exception": false,
     "start_time": "2023-10-24T21:15:48.252112",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# c. De la variable year generada en b debe sacar la expresión “Y” al principio de cada string.\n",
    "# Por ejemplo, si el valor es Y1961 usted se debe quedar con 1961. Hint: revise las funciones mutate(), str_to_replace() (5 puntos)."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "62ff1a03",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T21:15:48.289095Z",
     "iopub.status.busy": "2023-10-24T21:15:48.287674Z",
     "iopub.status.idle": "2023-10-24T21:15:48.299607Z",
     "shell.execute_reply": "2023-10-24T21:15:48.297931Z"
    },
    "papermill": {
     "duration": 0.020041,
     "end_time": "2023-10-24T21:15:48.301951",
     "exception": false,
     "start_time": "2023-10-24T21:15:48.281910",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# d. A partir de la variable year generada en c y months, usted debe construir una variable nueva llamada date con la siguiente estructura:\n",
    "# months  | year | date\n",
    "# January | 1961 | 1961-01-15\n",
    "# La variable date debe ser de tipo “Date”, puede verificar esto con la función class().\n",
    "# Hint: revise la funciones mutate(), paste() y as.Date() (10 puntos)."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3cb44b54",
   "metadata": {
    "papermill": {
     "duration": 0.004014,
     "end_time": "2023-10-24T21:15:48.310034",
     "exception": false,
     "start_time": "2023-10-24T21:15:48.306020",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 3. Unión de bases de datos\n",
    "\n",
    "Una vez procesada cada tabla, debe unir por filas en un solo gran marco de datos con el nombre de df solo las tablas que tengan la información completa desde el año 1961 al 2019. Guarde su resultado final en su directorio con una extensión .csv. Por ejemplo: df_final.csv. Hint: revise las funciones `bind_rows`, add_rows, etc., además de las estructuras de control if y else para ejecutar el proceso. La función debe retornar un marco de datos final con las siguientes columnas: area, months, year, temperatura_change y date (10 puntos)."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "0136bd1a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T21:15:48.321476Z",
     "iopub.status.busy": "2023-10-24T21:15:48.320008Z",
     "iopub.status.idle": "2023-10-24T21:15:48.331689Z",
     "shell.execute_reply": "2023-10-24T21:15:48.330049Z"
    },
    "papermill": {
     "duration": 0.020048,
     "end_time": "2023-10-24T21:15:48.334123",
     "exception": false,
     "start_time": "2023-10-24T21:15:48.314075",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# exportar como .csv"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3b8d9ed7",
   "metadata": {
    "papermill": {
     "duration": 0.003935,
     "end_time": "2023-10-24T21:15:48.342291",
     "exception": false,
     "start_time": "2023-10-24T21:15:48.338356",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 4. Missing Values\n",
    "\n",
    "Para los países que no tengan la información completa debe construir una tabla nueva que indique el país y el porcentaje total de missing values. Debe exportar su objeto en una tabla de excel con el nombre de: `tabla_missing.xlsx` (10 puntos)."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "5c4495ca",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T21:15:48.353686Z",
     "iopub.status.busy": "2023-10-24T21:15:48.352190Z",
     "iopub.status.idle": "2023-10-24T21:15:48.365328Z",
     "shell.execute_reply": "2023-10-24T21:15:48.363652Z"
    },
    "papermill": {
     "duration": 0.022092,
     "end_time": "2023-10-24T21:15:48.368326",
     "exception": false,
     "start_time": "2023-10-24T21:15:48.346234",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# exportar como .xlsx"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 8.799898,
   "end_time": "2023-10-24T21:15:48.493435",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-10-24T21:15:39.693537",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
