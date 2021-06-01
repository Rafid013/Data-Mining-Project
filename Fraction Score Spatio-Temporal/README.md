* Compile the source codes for Fraction-Score using the command-  
  *make*

# Running Codes for Experiment 1
Before running the main code for the experiment, we need to preprocess the data. The code for preprocessing data is available here-  
https://colab.research.google.com/drive/1Rm3DZXy7NTbbee2zKgl721VjXQWpuk7z  
* Mount the drive folder in google folder if necessary
* First, we need to run the code under the section **Preprocess Data**
* Before running, make sure the project folder path (folder variable in the code) and Dataset location is correctly provided (_incidents.csv_ file of our Dataset should be located in a folder named **Data** which should be inside the project folder
* Download the **Slot Data** folder that is created and keep it in the same folder where the file **run_fraction_score_exp1.sh** is located
* Now, run the bash script named **run_fraction_score_exp1.sh**
* This script handles running the code for Fraction-Score for each possible parameter configuration and saves the results
* All the co-location patterns are stored in **Results_EXP1** directory
* All the statistics are stored in **Stats_EXP1** directory
* Now, we have to upload the folder **Results_EXP1** to drive in the project folder
* Finally, we have to run the code under the section **Process Results** available at https://colab.research.google.com/drive/1Rm3DZXy7NTbbee2zKgl721VjXQWpuk7z 
* The Spatio-Temporal patterns will be available in the folder named **Final Patterns**
* The files inside this folder follow the naming convention- final_patterns_< temporal threshold > < spatial support threshold > < distance threshold > < number of time slot >.txt
