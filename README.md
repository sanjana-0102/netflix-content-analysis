# Netflix Content Strategy Analysis | Excel | SQL | Power BI

## 📌 Objective
Analyzed 8800+ Netflix titles to understand content strategy, regional focus, and genre trends to help with business decisions.

## 🗂 Project Structure
- `data/raw_netflix_titles.csv` - Raw dataset from Kaggle
- `data/cleaned_netflix_titles.xlsx` - Cleaned dataset (nulls handled, new columns added)
- `sql/` - Table creation + 10 business analysis queries
- `powerbi/` - Interactive dashboard (coming soon)

## 🛠 Tech Stack
- **Excel:** Data cleaning, handling nulls, text-to-columns
- **SQL:** MySQL - Joins, Group By, Date functions
- **Power BI:** DAX, Visualizations, Storytelling

## 🔧 Phase 1 - Excel Cleaning (Done) ✅
- Replaced 2634 director, 825 cast, 831 country blanks with "Unknown" using Find & Replace
- Created month_added = `LEFT(date_added, FIND(" ",date_added)-1)`
- Created year_added = `RIGHT(date_added,4)`
- Split duration into duration_value and duration_type using LEFT/MID + FIND
- Created primary_country = `LEFT(country, FIND(",",country&",")-1)` to handle "India, USA"
- Created primary_genre = `LEFT(listed_in, FIND(",",listed_in&",")-1)`
- Verified with Pivot: 6131 Movies, 2677 TV Shows, Top Country USA

## 🔍 Key Insights (from SQL)
- ~70% are Movies, 30% TV Shows
- USA, India, UK are top 3 content producers
- Content addition peaked in 2019
- TV-MA and TV-14 are most common ratings

## 🚀 How to Run
1. Import CSV to MySQL using create_table.sql
2. Run queries from analysis_queries.sql
3. Open .pbix file in Power BI Desktop

## 👩💻 Author
Sanjana - Aspiring Data Analyst | Python, SQL, Power BI
