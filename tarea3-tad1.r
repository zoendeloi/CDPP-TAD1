{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "0d3f8953",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2023-10-24T16:05:16.633238Z",
     "iopub.status.busy": "2023-10-24T16:05:16.630378Z",
     "iopub.status.idle": "2023-10-24T16:05:16.951269Z",
     "shell.execute_reply": "2023-10-24T16:05:16.949297Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 0.332334,
     "end_time": "2023-10-24T16:05:16.954519",
     "exception": false,
     "start_time": "2023-10-24T16:05:16.622185",
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
   "id": "e7d9751f",
   "metadata": {
    "papermill": {
     "duration": 0.005046,
     "end_time": "2023-10-24T16:05:16.964957",
     "exception": false,
     "start_time": "2023-10-24T16:05:16.959911",
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
   "id": "d013dce1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T16:05:17.017262Z",
     "iopub.status.busy": "2023-10-24T16:05:16.978292Z",
     "iopub.status.idle": "2023-10-24T16:05:18.020752Z",
     "shell.execute_reply": "2023-10-24T16:05:18.017926Z"
    },
    "papermill": {
     "duration": 1.0539,
     "end_time": "2023-10-24T16:05:18.023852",
     "exception": false,
     "start_time": "2023-10-24T16:05:16.969952",
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
    "library(patchwork) # Compactar figuras"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9d7cd995",
   "metadata": {
    "papermill": {
     "duration": 0.005559,
     "end_time": "2023-10-24T16:05:18.034869",
     "exception": false,
     "start_time": "2023-10-24T16:05:18.029310",
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
   "id": "c11b6121",
   "metadata": {
    "papermill": {
     "duration": 0.005847,
     "end_time": "2023-10-24T16:05:18.046421",
     "exception": false,
     "start_time": "2023-10-24T16:05:18.040574",
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
   "execution_count": null,
   "id": "1ba2c511",
   "metadata": {
    "papermill": {
     "duration": 0.005912,
     "end_time": "2023-10-24T16:05:18.058051",
     "exception": false,
     "start_time": "2023-10-24T16:05:18.052139",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "6344aaa4",
   "metadata": {
    "papermill": {
     "duration": 0.005198,
     "end_time": "2023-10-24T16:05:18.068547",
     "exception": false,
     "start_time": "2023-10-24T16:05:18.063349",
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
   "execution_count": 3,
   "id": "20d69879",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T16:05:18.085716Z",
     "iopub.status.busy": "2023-10-24T16:05:18.083473Z",
     "iopub.status.idle": "2023-10-24T16:05:18.099620Z",
     "shell.execute_reply": "2023-10-24T16:05:18.097498Z"
    },
    "papermill": {
     "duration": 0.044087,
     "end_time": "2023-10-24T16:05:18.118210",
     "exception": false,
     "start_time": "2023-10-24T16:05:18.074123",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# a. Limpiar los nombres de las columnas para que queden en minúsculas. Hint: Revise las funciones tolower() o str_to_lower() (5 puntos)."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "5909e555",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T16:05:18.134064Z",
     "iopub.status.busy": "2023-10-24T16:05:18.132181Z",
     "iopub.status.idle": "2023-10-24T16:05:18.146025Z",
     "shell.execute_reply": "2023-10-24T16:05:18.144006Z"
    },
    "papermill": {
     "duration": 0.02464,
     "end_time": "2023-10-24T16:05:18.148981",
     "exception": false,
     "start_time": "2023-10-24T16:05:18.124341",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# b. Transformar las columnas Y1961 hasta Y2019 en filas, en otras palabras, se le pide transformar la tabla de formato wide a formato long.\n",
    "# Hint: revise la función pivot_longer().\n",
    "# La variable con los años se debe llamar year y la variable con los valores de temperatura promedio se debe llamar temperature_change (10 puntos)."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "f88b511c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T16:05:18.165744Z",
     "iopub.status.busy": "2023-10-24T16:05:18.164000Z",
     "iopub.status.idle": "2023-10-24T16:05:18.178012Z",
     "shell.execute_reply": "2023-10-24T16:05:18.176033Z"
    },
    "papermill": {
     "duration": 0.026322,
     "end_time": "2023-10-24T16:05:18.181123",
     "exception": false,
     "start_time": "2023-10-24T16:05:18.154801",
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
   "execution_count": 6,
   "id": "fc225fee",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T16:05:18.196643Z",
     "iopub.status.busy": "2023-10-24T16:05:18.194813Z",
     "iopub.status.idle": "2023-10-24T16:05:18.210361Z",
     "shell.execute_reply": "2023-10-24T16:05:18.207754Z"
    },
    "papermill": {
     "duration": 0.026983,
     "end_time": "2023-10-24T16:05:18.213939",
     "exception": false,
     "start_time": "2023-10-24T16:05:18.186956",
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
   "id": "063f9503",
   "metadata": {
    "papermill": {
     "duration": 0.005919,
     "end_time": "2023-10-24T16:05:18.226707",
     "exception": false,
     "start_time": "2023-10-24T16:05:18.220788",
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
   "execution_count": 7,
   "id": "4ce39216",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T16:05:18.242908Z",
     "iopub.status.busy": "2023-10-24T16:05:18.241054Z",
     "iopub.status.idle": "2023-10-24T16:05:18.255455Z",
     "shell.execute_reply": "2023-10-24T16:05:18.253106Z"
    },
    "papermill": {
     "duration": 0.026358,
     "end_time": "2023-10-24T16:05:18.258714",
     "exception": false,
     "start_time": "2023-10-24T16:05:18.232356",
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
   "id": "4f64ff7f",
   "metadata": {
    "papermill": {
     "duration": 0.005392,
     "end_time": "2023-10-24T16:05:18.269895",
     "exception": false,
     "start_time": "2023-10-24T16:05:18.264503",
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
   "execution_count": 8,
   "id": "6870d909",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T16:05:18.286182Z",
     "iopub.status.busy": "2023-10-24T16:05:18.284468Z",
     "iopub.status.idle": "2023-10-24T16:05:18.298310Z",
     "shell.execute_reply": "2023-10-24T16:05:18.296263Z"
    },
    "papermill": {
     "duration": 0.025061,
     "end_time": "2023-10-24T16:05:18.301141",
     "exception": false,
     "start_time": "2023-10-24T16:05:18.276080",
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
   "duration": 5.767857,
   "end_time": "2023-10-24T16:05:18.429610",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-10-24T16:05:12.661753",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
