{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "73afe239",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T15:52:53.359925Z",
     "iopub.status.busy": "2023-10-24T15:52:53.356941Z",
     "iopub.status.idle": "2023-10-24T15:52:53.640643Z",
     "shell.execute_reply": "2023-10-24T15:52:53.637914Z"
    },
    "papermill": {
     "duration": 0.29567,
     "end_time": "2023-10-24T15:52:53.643575",
     "exception": false,
     "start_time": "2023-10-24T15:52:53.347905",
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
       "\t<tr><th scope=row>Ncells</th><td> 959910</td><td>51.3</td><td>1949558</td><td>104.2</td><td>1249132</td><td>66.8</td></tr>\n",
       "\t<tr><th scope=row>Vcells</th><td>1702392</td><td>13.0</td><td>8388608</td><td> 64.0</td><td>2651364</td><td>20.3</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 2 × 6 of type dbl\n",
       "\\begin{tabular}{r|llllll}\n",
       "  & used & (Mb) & gc trigger & (Mb) & max used & (Mb)\\\\\n",
       "\\hline\n",
       "\tNcells &  959910 & 51.3 & 1949558 & 104.2 & 1249132 & 66.8\\\\\n",
       "\tVcells & 1702392 & 13.0 & 8388608 &  64.0 & 2651364 & 20.3\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 2 × 6 of type dbl\n",
       "\n",
       "| <!--/--> | used | (Mb) | gc trigger | (Mb) | max used | (Mb) |\n",
       "|---|---|---|---|---|---|---|\n",
       "| Ncells |  959910 | 51.3 | 1949558 | 104.2 | 1249132 | 66.8 |\n",
       "| Vcells | 1702392 | 13.0 | 8388608 |  64.0 | 2651364 | 20.3 |\n",
       "\n"
      ],
      "text/plain": [
       "       used    (Mb) gc trigger (Mb)  max used (Mb)\n",
       "Ncells  959910 51.3 1949558    104.2 1249132  66.8\n",
       "Vcells 1702392 13.0 8388608     64.0 2651364  20.3"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "gc()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0d70bd5c",
   "metadata": {
    "papermill": {
     "duration": 0.004998,
     "end_time": "2023-10-24T15:52:53.654474",
     "exception": false,
     "start_time": "2023-10-24T15:52:53.649476",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Tarea 3\n",
    "\n",
    "### Taller de Análisis de Datos 1\n",
    "\n",
    "Mario Bravo y Enzo Loiza"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "d19459ff",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T15:52:53.705271Z",
     "iopub.status.busy": "2023-10-24T15:52:53.666778Z",
     "iopub.status.idle": "2023-10-24T15:52:54.694684Z",
     "shell.execute_reply": "2023-10-24T15:52:54.692749Z"
    },
    "papermill": {
     "duration": 1.038587,
     "end_time": "2023-10-24T15:52:54.698250",
     "exception": false,
     "start_time": "2023-10-24T15:52:53.659663",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.2     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.2     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.2     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.1     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f789ef37",
   "metadata": {
    "papermill": {
     "duration": 0.006413,
     "end_time": "2023-10-24T15:52:54.710592",
     "exception": false,
     "start_time": "2023-10-24T15:52:54.704179",
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
   "id": "83df0e31",
   "metadata": {
    "papermill": {
     "duration": 0.005639,
     "end_time": "2023-10-24T15:52:54.721413",
     "exception": false,
     "start_time": "2023-10-24T15:52:54.715774",
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
   "id": "9ecb8f2d",
   "metadata": {
    "papermill": {
     "duration": 0.005122,
     "end_time": "2023-10-24T15:52:54.732343",
     "exception": false,
     "start_time": "2023-10-24T15:52:54.727221",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "759529d6",
   "metadata": {
    "papermill": {
     "duration": 0.005487,
     "end_time": "2023-10-24T15:52:54.742935",
     "exception": false,
     "start_time": "2023-10-24T15:52:54.737448",
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
   "id": "dbf07b20",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T15:52:54.759038Z",
     "iopub.status.busy": "2023-10-24T15:52:54.756849Z",
     "iopub.status.idle": "2023-10-24T15:52:54.771891Z",
     "shell.execute_reply": "2023-10-24T15:52:54.769909Z"
    },
    "papermill": {
     "duration": 0.026573,
     "end_time": "2023-10-24T15:52:54.774614",
     "exception": false,
     "start_time": "2023-10-24T15:52:54.748041",
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
   "id": "844b66d1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T15:52:54.789070Z",
     "iopub.status.busy": "2023-10-24T15:52:54.787238Z",
     "iopub.status.idle": "2023-10-24T15:52:54.801136Z",
     "shell.execute_reply": "2023-10-24T15:52:54.799278Z"
    },
    "papermill": {
     "duration": 0.024242,
     "end_time": "2023-10-24T15:52:54.803937",
     "exception": false,
     "start_time": "2023-10-24T15:52:54.779695",
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
   "id": "54f00287",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T15:52:54.819309Z",
     "iopub.status.busy": "2023-10-24T15:52:54.817211Z",
     "iopub.status.idle": "2023-10-24T15:52:54.831221Z",
     "shell.execute_reply": "2023-10-24T15:52:54.829280Z"
    },
    "papermill": {
     "duration": 0.024887,
     "end_time": "2023-10-24T15:52:54.834042",
     "exception": false,
     "start_time": "2023-10-24T15:52:54.809155",
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
   "id": "089e05ab",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T15:52:54.848753Z",
     "iopub.status.busy": "2023-10-24T15:52:54.846748Z",
     "iopub.status.idle": "2023-10-24T15:52:54.861635Z",
     "shell.execute_reply": "2023-10-24T15:52:54.859742Z"
    },
    "papermill": {
     "duration": 0.026176,
     "end_time": "2023-10-24T15:52:54.865532",
     "exception": false,
     "start_time": "2023-10-24T15:52:54.839356",
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
   "id": "5e534548",
   "metadata": {
    "papermill": {
     "duration": 0.005261,
     "end_time": "2023-10-24T15:52:54.876270",
     "exception": false,
     "start_time": "2023-10-24T15:52:54.871009",
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
   "id": "0d3a5cb3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T15:52:54.892504Z",
     "iopub.status.busy": "2023-10-24T15:52:54.890492Z",
     "iopub.status.idle": "2023-10-24T15:52:54.905818Z",
     "shell.execute_reply": "2023-10-24T15:52:54.903679Z"
    },
    "papermill": {
     "duration": 0.027082,
     "end_time": "2023-10-24T15:52:54.909195",
     "exception": false,
     "start_time": "2023-10-24T15:52:54.882113",
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
   "id": "618b67ba",
   "metadata": {
    "papermill": {
     "duration": 0.005206,
     "end_time": "2023-10-24T15:52:54.920047",
     "exception": false,
     "start_time": "2023-10-24T15:52:54.914841",
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
   "id": "f3e8c808",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-10-24T15:52:54.934556Z",
     "iopub.status.busy": "2023-10-24T15:52:54.932844Z",
     "iopub.status.idle": "2023-10-24T15:52:54.947214Z",
     "shell.execute_reply": "2023-10-24T15:52:54.945379Z"
    },
    "papermill": {
     "duration": 0.025234,
     "end_time": "2023-10-24T15:52:54.950568",
     "exception": false,
     "start_time": "2023-10-24T15:52:54.925334",
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
   "duration": 5.485291,
   "end_time": "2023-10-24T15:52:55.078455",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-10-24T15:52:49.593164",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
