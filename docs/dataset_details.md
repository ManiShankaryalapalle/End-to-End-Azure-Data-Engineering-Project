\# 🌍 Daily Global Capitals Weather Data (2025)



\*\*Daily weather statistics for every world capital\*\*  

\_Auto-updated via Open-Meteo\_



\---



\## 📊 About Dataset



\*\*Dataset Name:\*\* Global Capitals Daily Weather  

\*\*Source:\*\* Kaggle  

\*\*License:\*\* CC BY 4.0  



\---



\## 📌 Overview



This dataset provides \*\*daily weather summaries for national capital cities worldwide\*\*, automatically updated each day from the Open-Meteo API.



Each record includes:

\- Temperature extremes

\- Precipitation totals

\- Wind data

\- Daylight and solar radiation information



Each row represents:

> \*\*One capital city × one day\*\*



\---



\## 🔄 Update Process



\- Data is collected using a \*\*scheduled Kaggle Notebook\*\*

\- Runs daily at approximately \*\*06:00 UTC\*\*

\- Fetches \*\*previous day’s weather data\*\*

\- Appends to historical dataset

\- Publishes a new dataset version



⚠️ Note:

\- No raw/intermediate files are stored

\- Only clean processed outputs are maintained



\---



\## 📂 Files



| File | Description |

|------|------------|

| `history.parquet` | Full time-series dataset (all cities × all days) |

| `history\_latest.csv` | Latest day's snapshot |

| `capitals\_clean.parquet` | Reference table with country codes \& coordinates |



\---



\## 🧩 Schema



\### Applicable to:

\- `history.parquet`

\- `history\_latest.csv`



| Column | Type | Units | Description |

|-------|------|------|------------|

| date | string (YYYY-MM-DD) | — | Observation date (UTC) |

| country | string | — | Country name |

| country\_alpha2 | string | — | ISO-3166-1 alpha-2 code |

| capital | string | — | Capital city |

| lat, lon | float | degrees | Coordinates |

| temp\_min\_c, temp\_max\_c, temp\_mean\_c\_approx | float | °C | Temperature metrics |

| app\_temp\_min\_c, app\_temp\_max\_c | float | °C | Apparent temperatures |

| precip\_mm, rain\_mm, snow\_mm | float | mm | Precipitation values |

| windspeed\_10m\_max\_kmh, windgusts\_10m\_max\_kmh | float | km/h | Wind speed \& gusts |

| wind\_dir\_dom\_deg | float | degrees | Dominant wind direction |

| sunshine\_duration\_s, daylight\_duration\_s | float | seconds | Sunlight durations |

| shortwave\_radiation\_MJ\_m2 | float | MJ/m² | Solar radiation energy |



\---



\## 🌐 Data Sources



\- Weather data: Open-Meteo (CC BY 4.0)

\- Capital coordinates: Wikidata (CC0 1.0)



\---



\## ⚖️ License \& Attribution



This dataset is released under:



\*\*Creative Commons Attribution 4.0 International (CC BY 4.0)\*\*



\### Attribution:



\- Weather data © Open-Meteo  

\- Capital metadata © Wikidata contributors  

\- Compiled and processed by: \*\*wafaaelhusseini\*\*



\---



\## 🙏 Acknowledgment



Special thanks to the dataset creator and contributors on Kaggle for providing this dataset.



\---



\## 🔗 Source Link



👉 https://www.kaggle.com/datasets/wafaaelhusseini/daily-global-capitals-weather-data

