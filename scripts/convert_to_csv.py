import pandas as pd
import os

# Set the correct file paths for your project
xlsx_file_path = 'C:/Users/steve/Documents/SuperStore_Project_2023/Superstore_Project_2023/data/superstore_project_2023.xlsx'
csv_folder_path = 'C:/Users/steve/Documents/SuperStore_Project_2023/Superstore_Project_2023/data/'

# Load the Excel file
xlsx = pd.read_excel(xlsx_file_path, sheet_name=None)

# Export each sheet to a separate CSV file
for sheet_name, sheet_data in xlsx.items():
    sheet_data.to_csv(os.path.join(csv_folder_path, f'{sheet_name}.csv'), index=False)



#  Explanations for each line of code (in both beginner-level and intermediate-level fashion).

# import pandas as pd

# Beginner: This line imports the Pandas library, which is a popular library for data manipulation in Python. We import it as "pd" for short, so we can use "pd" instead of writing "pandas" every time we use its functions.

# Intermediate: This line imports the Pandas library and assigns it a namespace alias "pd" to follow the common convention and make the code more readable.

# input_file = r"C:\Users\steve\Documents\SuperStore_Project_2023\Superstore_Project_2023\data\superstore_project_2023.xlsx"

# Beginner: This line creates a variable called input_file and sets it to the file path of the .xlsx file we want to read.

# Intermediate: This line defines a string variable input_file containing the path to the input .xlsx file, using a raw string (indicated by the 'r' prefix) to avoid issues with backslashes in the path.

# output_path = r"C:\Users\steve\Documents\SuperStore_Project_2023\Superstore_Project_2023\data"

# Beginner: This line creates a variable called output_path and sets it to the folder where we want to save the .csv files.

# Intermediate: This line defines a string variable output_path containing the path to the output directory for the generated .csv files, using a raw string to avoid issues with backslashes in the path.

# xlsx = pd.read_excel(input_file, sheet_name=None, engine='openpyxl')

# Beginner: This line reads the .xlsx file and stores its content in a variable called xlsx. The sheet_name=None part tells the function to read all sheets in the file.

# Intermediate: This line uses the Pandas read_excel function to read the input .xlsx file, with the sheet_name=None parameter to read all sheets and store them in an OrderedDict, and the engine='openpyxl' parameter to specify the openpyxl engine for handling .xlsx files.

# for sheet_name, sheet_data in xlsx.items():

# Beginner: This line is the start of a loop that goes through each sheet in the .xlsx file. sheet_name is the name of the current sheet, and sheet_data is the data in the current sheet. The loop will run once for each sheet in the file.

# Intermediate: This line initiates a for loop, iterating over the key-value pairs in the OrderedDict xlsx (created by pd.read_excel). The loop variables sheet_name and sheet_data hold the sheet name (key) and the corresponding data as a DataFrame (value), respectively.

# output_file = f"{output_path}\\{sheet_name}.csv"

# Beginner: This line creates a variable called output_file and sets it to the file path where we want to save the .csv file for the current sheet. The file will be named after the sheet name and saved in the output_path folder.

# Intermediate: This line defines a formatted string variable output_file containing the path to the output .csv file for the current sheet, using string interpolation to include the output_path and sheet_name variables in the path.

# sheet_data.to_csv(output_file, index=False)

# Beginner: This line saves the data in the current sheet as a .csv file. It saves the file at the path we 
# specified in output_file. The index=False part tells the function not to save the index column of the data in the .csv file.

# Intermediate: This line uses the to_csv method of the DataFrame object sheet_data to write the data to a .csv file at the specified output_file path, with the index=False parameter to exclude the index column from the output file.

# In summary, this script reads an .xlsx file containing multiple sheets, iterates over each sheet, and saves each sheet's data as a separate .csv file in the specified output directory.
