# **Insiders Clustering**
![image](https://user-images.githubusercontent.com/110054775/198704149-2ac2bdde-da42-40ef-a440-8bd1974cba4b.png)

## 1. Business Problem
The company Track Market is a multibrand company that sell its products through an e-commerce. The company's rapid growth demands that the marketing and sales teams spend their resources according to the customer's profile, so they ask us to define an insiders program with the most valuable and loyal customers. 

## 2. Solution Planning

**Input**
- Business Problem: select the most valuable customers to join a loyalty program (Insiders program).
- Data: e-commerce sales over 1 year period.

**Output**
- The indication of people who will be part of the Insiders Program
- Report contaning analyses of the main features of the cluster and data

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

#### Step 3: Feature Engineering
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

#### Step 9: Model Deploy
- Transfer data and machine learn model to AWS (S3, EC2 and RDS)
- Create RDS database and create dashboard on Metabase

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

![image](https://user-images.githubusercontent.com/110054775/198904644-3efe3c3c-9ff9-4217-8d41-4c2a66660a29.png)

The highest silhouette scores were seen when cluster numbers were 8 or 9. However, the **k** number were defined as 7, since a low number can be more manageable for the business. In addition, K-Means was chosen to be clustering model despite presenting a very similar perfomance compared to HC model.

![image](https://user-images.githubusercontent.com/110054775/198904955-d384ae1f-277b-468e-a5be-b5702ca7ba55.png)

The image above, shows us the presence of well defined clusters, far from each other, what represents a silhouette score of 0,63.

## 5. Model Deploy

The model was deployed through the jupyter notebook in EC2 instance running Ubuntu. Data was imported from a S3 bucket and the output is save on a PostgreSQL database in AWS RDS in order to be visualized with the help of Metabase

![image](https://user-images.githubusercontent.com/110054775/198916207-79174a05-b527-4af0-ade3-cbab15243b69.png)


## 6. Conclusion and Cluster's Profile

This project used as a base for the features, the Recency, Frequency and Gross Revenues of each customer

![image](https://user-images.githubusercontent.com/110054775/198917830-99e00583-42d1-4f57-bba0-1419a3daf845.png)

Since Gross Revenue was the target variable for the embedding creating, the Insiders are define as the group of people which spends more and have a low recency.

**Clusters Profile**
- **0: Insiders**
  - Group of people with the highest expenses, this group don't have a high purchase frequency. It is suggested to create action to make those people to purchase more products in the same purchase: promotions based on products quantity, discounts based on the type of products purchased.

- **4: Silver Customers**
  - Group with a relevant number of integrants, high frequency (> 0.6) and less than 2 months since last shopping. This group has a low Gross Revenue, so it is suggested to create heavy promotions based on their type of shopping.

- **5: Edge Customers**
  - Group of people which do not spend much money, although they has high frequency of shopping. They look like customers which lost interest in the products, so it is suggested to create marketing campaign focusing on new products launches and researcher in order to reach these customers interests

## 7. Next Steps
- To create a cronjob together at a papermill code, in order to automate the jupyter notebook
- Create and experiment new features in order to get better clusters
