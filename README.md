# **Insiders Clustering**
![image](https://user-images.githubusercontent.com/110054775/198704149-2ac2bdde-da42-40ef-a440-8bd1974cba4b.png)

## 1. Business Problem
The company Track Market is a multibrand company that sell its products through an e-commerce. The company's rapid growth demands that the marketing and sales teams spend their resources according to the customer's profile, so they ask us to define an insiders program with the most valuable and loyal customers. 
As a result of the project, it is expected answer some questions:

1. Who are the people eligible to participate in the Insiders program?
2. How many customers will be part of the group?
3. What are the main characteristics of these customers?
4. What percentage of revenue contribution comes from Insiders?
5. What are the conditions for a person to be eligible for Insiders?
6. What are the conditions for a person to be removed from Insiders?

## 2. Solution Planning

**Input**
- Business Problem: select the most valuable customers to join a loyalty program (Insiders program).
- Data: e-commerce sales over 1 year period.

**Output**
- The indication of people who will be part of the Insiders Program
- Report contaning the solutions for the business questions

### 2.1 Analysis Strategy

I created a solution based in RFM analysis. RFM stands for Recency, Frequency, and Monetary value and it works as a important indicator of the customer's behavior.
Read more about RFM in: https://clevertap.com/blog/rfm-analysis/
![image](https://user-images.githubusercontent.com/110054775/198715485-31e162f5-9b03-40eb-9c88-11bc0770e61a.png)

### 2.2 CRISP-DM
This project was carried out following CRISP-DM (Cross-Industry Standard Process for Data Mining) methodology. You can read more about it on: https://www.datascience-pm.com/crisp-dm-2/

#### Step 1: Data Description
- Imported data from AWS S3
- Checked data types and the shape
- Checked NA values and replace them
- Descriptive Statistical

#### Step 2: Data Filtering
- Data were filtered in unit price, stock code and quantity features

### Step 3: Feature Engineering
- Created features based on RFM
- Other features were tested in order to increase the cluster model performance and create more cohesive groups

#### Step 4: Exploratory Data Analysis
- Univariate analysis (Pandas Profiling) in order to:
  - Check customer's that represents inconsistents outliers
  - Analyze variability of the features

#### Step 5: Data Preparation
- Rescale features

#### Step 6: Feature Selection
- Select the features that promote greater variation in data

#### Step 7: Embedding Study
- Check in which space the data are better clustered

#### Step 8: Machine Learning Modeling and Hyperparameter Fine-Tuning
- Test different clustering models, such as K-Means, GMM and Hierarchical Cluster inside the embedding that was defined in step 7
- Test different k numbers in order to indentify how many clusters data can be divided
- Compare the models performance
- Silhouette analyses in order to check the cluster's quality

## 3. Embedding Analysis

The Tree-Based Embedding showed better defined clusters. So it was evaluated inside UMAP and TSNE

**UMAP**
The UMAP embedding clusters showed clusters far from each other and the capacity of working with a lower number of them.

![image](https://user-images.githubusercontent.com/110054775/198726318-fb737f38-7ce7-4b54-bfa8-7d30cf9537a5.png)

**T-SNE**
Although the clusters in T-SNE embedding showed a better aglomeration and defined clusters, the tendency is to create a higher number of clusters and this can be a non-efficient result to the problem.

![image](https://user-images.githubusercontent.com/110054775/198726873-20b1f96b-9a9a-4f1b-9f2a-3727b74619e7.png)

## 4. Model Performance

The modesl applied were K-Means, GMM, Hierarchical Cluster and DBSCAN. 

Different **k** numbers were tested for these models

|Model  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9  |  10  |  11  |  12  |  13  |
--------
|K-Means|
|GMM    |
|Hc     |


