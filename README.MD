# AI Wealth Manager: Transforming Financial Advisory with AI
Embark on an exciting journey into the world of AI Wealth Management! This innovative process leverages AI to provide personalized financial advice and investment strategies. The foundational step in this process is creating a vector store, a dynamic tool designed for performing vector or semantic searches based on meaning. AI Wealth Management uses proprietary data to make precise recommendations.

|Complete Walkthrough Video|    
|---------------------------|   
|[Click here to watch a 25 Minute Video on what you will create](https://www.youtube.com/watch?v=Sv_59o66hRE)|   
|<a href="https://www.youtube.com/watch?v=Sv_59o66hRE" target="video"><img src="https://img.youtube.com/vi/Sv_59o66hRE/0.jpg" width="700px" height="480px"></a>|   

In the context of AI Wealth Management, a vector is a mathematical representation of data that captures its semantic meaning. It is a numerical array, where each element of the array represents a feature or characteristic of the data. Vectors are used to encode information in a way that can be easily processed by machine learning models, particularly for tasks that involve understanding and generating natural language.

### How Vectors Are Used by AI Wealth Manager     
   
***Data Representation:***   
   
Vectors transform raw data (such as financial statements, market data, or client profiles) into a structured format that models can understand. For text, this involves converting words, sentences, or documents into fixed-length arrays of numbers.   

***Semantic Search:***   
   
Vectors allow for semantic search, meaning searches based on the meaning of the data rather than just keywords. For example, similar financial terms or phrases will have similar vector representations, enabling more accurate and relevant search results.   

***Personalized Financial Advice:***   
   
In AI Wealth Management, vectors are used to retrieve relevant data from a vector database. When a query is made, the system converts it into a vector and searches the vector database for the closest matches. This relevant data is then used to generate context-aware financial advice or investment strategies.      

***Training and Inference:***   
   
During the training phase, AI models learn to convert input data into vectors that capture the essential features and relationships. During inference, these vectors are used to generate outputs, such as financial advice, investment recommendations, or risk assessments.   
   
***Contextual Understanding:***

Vectors enable AI models to understand the context and relationships between different pieces of financial data. For instance, in natural language processing (NLP), vectors can represent the context of financial terms within a document, helping the model generate coherent and contextually appropriate advice.

### Example Use in AI Wealth Management
Imagine an AI Wealth Manager system designed to recommend investment strategies based on user preferences:   
   
User Query: "Find me a low-risk investment with high returns."   
Vectorization: The query is converted into a vector.   
Semantic Search: The vector is used to search a vector database of investment options.   
Data Retrieval: The most relevant options (low-risk investments with high returns) are retrieved.   
Advice Generation: These options are used to create a prompt for the AI model.   
AI Response: The AI model generates a response with specific and accurate investment recommendations for the user.   
   
In summary, vectors are essential for transforming unstructured financial data into a format that AI Wealth Management can effectively process, enabling tasks like semantic search, contextual understanding, and precise data retrieval.   

## Getting started ##

In this github example, financial data from source systems will be vector encoded in real-time as data changes. It will be inserted as the data sourced from a connector into a topic. It will then be converted into a vector with Flink SQL and inserted into a new topic. The connector architecture will then sink this data into a vector database. This GitHub example shows you how to do this first step of hydrating and maintaining a vector database without using any batch ETL processes. 

Next, the AI Wealth Manager application will query this vector database. With the user profile data and questions, the meaning will be matched to the investment preferences and risk tolerance requested by the user's query. The results will be sent to the AI model as prompts, ensuring that the recommendations made by the AI are specific and accurate.

Traditional developers often rely on batch processes to vector encode their data, leading to stale data and a labyrinth of point-to-point ETL integrations that demand constant maintenance. But what if there was a better way? Imagine building and maintaining a vector database with real-time data, free from the cumbersome batch ETL processes.

This GitHub repository is your gateway to that future. Dive in and discover how to revolutionize your approach to data augmentation for AI Wealth Management, making your workflows smarter, faster, and more efficient. Let's get started on transforming the way you handle financial data!  
   
![Flink SQL from CC GUI](/img/DataAugmentation.png)

## Prerequisites

Before you begin, ensure you have the following tools installed and configured on your system:

### Terraform

Terraform is an open-source infrastructure as code software tool that provides a consistent CLI workflow to manage hundreds of cloud services. 

* [Terraform Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)

To verify the installation of Terraform, you can follow these steps:

* Open a terminal or command prompt.
* Type `terraform -v` and press Enter.
* Check the output for the Terraform version information. If Terraform is installed correctly, it will display the version number.

If you see the version number, Terraform is installed correctly. If you encounter an error, you may need to reinstall Terraform following the installation instructions provided in the repository's `README.MD`.

### AWS CLI

The AWS Command Line Interface (CLI) is a unified tool to manage your AWS services. 

* [AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

To verify the installation of AWS CLI, you can follow these steps:

* Open a terminal or command prompt.
* Type `aws --version` and press Enter.
* Check the output for the AWS CLI version information. If AWS CLI is installed correctly, it will display the version number.

If you see the version number, AWS CLI is installed correctly. If you encounter an error, you may need to reinstall AWS CLI following the installation instructions provided in the repository's `README.MD`.

To configure AWS CLI, follow these steps:

* Download and install the AWS CLI from the official website here.
* Open a terminal or command prompt.
* Run the command `aws --version` to verify the installation. You should see the AWS CLI version information.
* Configure the AWS CLI by running the command `aws configure`.
* When prompted, enter your AWS Access Key ID, Secret Access Key, default region name, and default output format.
* Verify the configuration by running a simple AWS CLI command, such as `aws s3 ls`, to list your S3 buckets.

For more details, refer to the instructions in the `README.MD`.

### Python 3.11

Ensure you have Python 3.11 installed on your system. 

* [Python 3.11 Installation Guide](https://www.python.org/downloads/release/python-3110/)

### MongoDB Atlas Account

MongoDB Atlas is a fully-managed cloud database service that handles all the complexity of deploying, managing, and healing your deployments on the cloud service provider of your choice (AWS, Azure, or GCP).

To set up a MongoDB Atlas account, follow these steps:

* Go to the MongoDB Atlas website and click on the "Start Free" button.
* Sign up for a new account using your email address or sign in with an existing Google account.
* Once signed in, you will be prompted to create a new project. Enter a project name and click "Next".
* Choose a cloud provider and region for your cluster. MongoDB Atlas supports AWS, Google Cloud, and Azure. Select the provider and region that best suits your needs.
* Configure your cluster by selecting the cluster tier, which determines the resources and cost of your cluster. For a free tier, select the M0 Sandbox.
* Click "Create Cluster" to provision your cluster. This process may take a few minutes.
* After the cluster is created, you will be prompted to set up database access. Create a new database user by providing a username and password. Make sure to save these credentials as you will need them to connect to your cluster.
* Set up network access by adding your IP address to the IP whitelist. This allows your local machine to connect to the MongoDB Atlas cluster.
* Once the database user and network access are configured, click "Finish and Close".
* You can now connect to your MongoDB Atlas cluster using the connection string provided in the Atlas UI. Use this connection string in your application to interact with the MongoDB database.

For more detailed instructions, refer to the MongoDB Atlas documentation.

## DataGen Connector
Before we can convert data into vectors, we need some sample data. Setting up a connector to a financial database would be time-consuming, so for the purposes of this demo, we will generate some random data using Confluent Cloud's datagen connector. To get started, we need to create the datagen connector and have it insert data into a `wealth-management` topic.  

[Oracle Connector Example in Github Here](https://github.com/brittonlaroche/Oracle-Confluent-MongoDB)

![Flink SQL from CC GUI](/img/setupconnector.png) 

Create a topic named `wealth-management` 
Set up the datagen connector for wealth management data... Add a new connector, select datagen, then use the link for "additional configuration"    
   
![Datagen](/img/datagen.png) 

Use the **wealth-management** topic.   
You will need an api key, use one if you have it if not create one and save the secret.   
new connector --> datagen --> custom schema on configuration tab  

Use the link for "additional configuration" and select JSON_SR for JSON and Schema Registry.  
   
![Additional Config](/img/additionalconfig.png) 
   
Now we need a custom schema for wealth management data, we will use the custom schema "Provide Your Own Schema" on configuration tab.  
   
Get the wealth management schema that datagen will use to update random financial data here:      
[Wealth Management Schema](https://raw.githubusercontent.com/brittonlaroche/Confluent-Kafka-Vector-Encoding/main/files/datagen/wealthManagerSchema.json)   

Paste it in the configuration tab.   

![Flink SQL from CC GUI](/img/additionalconfigjsonsr.png)   
   
Get the wealth management schema that datagen will use to update random financial data here:      
[Wealth Management Schema](https://raw.githubusercontent.com/brittonlaroche/Confluent-Kafka-Vector-Encoding/main/files/datagen/wealthManagerSchema.json)   
   
The datagen connector will generate random financial data simulating a real connector from an operational data store receiving financial updates.

You will need to adjust a couple of settings to get some of the data to display properly in the cloud gui.  Go to the Datagen Connector we just created and under "settings" Set the following parameters:   
   
`JSON output decimal format: BASE64`   
`Schema Context: Default`   
`Max interval between messages (MS): 25000`   

**Transforms**   
Add a new value single message transform.   
For the value of the investment_amount field set the spec to `investment_amount:float64`   
   
![Transforms from CC GUI](/img/transforms.png)   

## Flink SQL


### First Steps
Flink can be accessed through the environments menu on the left-hand side of the Confluent Cloud interface. Select your environment, then navigate to the "Flink SQL" tab, which is located in the middle of the screen, instead of the default "Clusters" tab. As of this GitHub update (August 13th, 2024), the ML_Predict function used in this github is in Early Access.    
   
**If you have issues with the ML_Predict Function because it is not available for your organization send me an email from your work email address to blaroche@confluent.io with the subject "Requesting EA ML_Predict function"** I will add your organization to the EA request list.  You should be good to go with in a day or so provided you do have an existing cloud organization for your company.  

![Flink SQL from CC GUI](/img/flinksql.png)

If flink is not set up you will need to create a new flink pool in the same region and cloud provider as your confluent cluster.  You can create a free basic cluster at for this exersize if you do not have a confluent cloud cluster here: [https://confluent.cloud/](https://confluent.cloud/)

You should issue these commands from the Confluent CLI. If you do not have the Confluent CLI, you can find the installation instructions [here](https://docs.confluent.io/confluent-cli/current/install.html). Instructions for connecting to your environment through the Confluent CLI are available [here](https://docs.confluent.io/confluent-cli/current/connect.html). 

Here are some useful confluent cli commands
```
confluent login --save --organization-id dacfbee1-acbc-my-org-id-from-the-cloud-gui

confluent environment list
confluent environment use env-myenv-from-list

confluent kafka cluster list
confluent kafka cluster use lkc-mycluster-from-list

confluent kafka topic list

```
 
   

#### 1. Set the connection information
Before we enter the flink environment we need to create the connection to the endpoint for the vector embedding service.  For this step you need an API key.  Theis example uses OPENAI, there are plenty to choose from, but to follow along and if you do not have an API key, no worries, you can get started by using the link below to get your own OPENAI API key.   
[https://platform.openai.com/docs/quickstart](https://platform.openai.com/docs/quickstart)
   
When creating a connection be sure to give it a recognizable name something that includes the provider and type of sevice like 'openai-vector-connection' for example.  Note the name needs to contain lowercase alphanumeric characters and hyphens only and can only start with alphabetic characters. Maximum length is 100 characters.   

The environment flag specifies the environment where flink sql is running. Its the one we created in the steps above in the Confluent Cloud gui butits not the name we are after its the id. I call it 'my-env-id' in the example below.  To get the list of environments we can use the 'confluent environment list' example below:

```
blaroche@C02DV0Y8MD6T ~ % confluent environment list
  Current |     ID     |                    Name                    | Stream Governance Package
----------+------------+--------------------------------------------+----------------------------
          | env-3rd2qm | Sandbox                                    | ADVANCED
          | env-3rvv69 | pg-sa-05pqy6-connect-aws-redshift-sink     |
          | env-3w87x9 | ccloud-stack-sa-zz09od-ccloud-stack-script |
          | env-5qxddr | GenAI                                      | ESSENTIALS
``` 

For example if we are working in the environment 'GenAI' then the environment id we need is 'env-5qxddr';

An example of creating a connection in the confluent cli is provided below:    
   
```
confluent flink connection create openai-vector-connection 
--cloud aws 
--region us-west-2 
--environment my-env-id         
--type openai
--endpoint 'https://api.openai.com/v1/embeddings' 
--api-key 'secret_key'
```   

Cutting and pasting the above won't work.  The confluent cli has an interesting feature that requires everything to be on one line with no carriage returns.  You can modify the following command and it should work.  I pasted it above with carriage returns so it would be easy to see all the flags in this readme.

```
confluent flink connection create openai-vector-connection --cloud aws --region us-west-2 --environment my-env-id --type openai --endpoint 'https://api.openai.com/v1/embeddings' --api-key 'secret_key'
```

Here is what success looks like:   

```
confluent flink connection create openai-vector-connection --cloud aws --region us-west-2 --environment my-env-id --type openai --endpoint 'https://api.openai.com/v1/embeddings' --api-key 'sk-proj-GZuhy1lt8BdZRTgM3xqbTthKQgKIH1'
+---------------+--------------------------------------+
| Creation Date | 2024-09-25 06:03:39.768738           |
|               | +0000 UTC                            |
| Name          | openai-vector-connection             |
| Type          | OPENAI                               |
| Endpoint      | https://api.openai.com/v1/embeddings |
| Data          | <REDACTED>                           |
| Status        |                                      |
+---------------+--------------------------------------+
```   

Anything less than success should give you a concise error message with the flags what they mean and what you messed up.  It should also provide you with an example of what it should look like.   
   
After setting the connection information we can now start working in Flink SQL.  A quick getting started guide can on the flink shell can be found [here](https://docs.confluent.io/cloud/current/flink/get-started/quick-start-shell.html#step-1-log-in-to-ccloud-with-the-confluent-cli).  
   
You should be able to connect to the Flink Shell with the following.   
   
![Flink SQL Copy Login](/img/flinksqllogincopy.png)   
   
Your specific environment and the connect information is displayed with a copy button (center near the bottom) in the image above. 
   
```
confluent flink shell --compute-pool lfcp-pool-from-gui --environment env-myenv-from-gui
```


Useful documentation for getting started with Flink Shell via the Confluent command line client can be found [here](https://docs.confluent.io/cloud/current/flink/get-started/quick-start-shell.html)

#### 2. Create the model for vector encoding

After logging into the flink command line we are now ready to create the model for vector encoding.  This is nothing more than data definition language (DDL) that defines the vector encoding service provider, the endpoint and the input and outputs.   

```
CREATE MODEL `vector_encoding`
INPUT (input STRING)
OUTPUT (vector ARRAY<FLOAT>)
WITH(
  'TASK' = 'embedding',
  'PROVIDER' = 'openai',
  'OPENAI.CONNECTION' = 'openai-vector-connection'
);
```

Below is an example of succesful output:  
```
CREATE MODEL `vector_encoding`
INPUT (input STRING)
OUTPUT (vector ARRAY<FLOAT>)
WITH(
  'TASK' = 'embedding',
  'PROVIDER' = 'openai',
  'OPENAI.CONNECTION' = 'openai-vector-connection'
);
Statement name: cli-2024-09-25-012912-2683d2ab-2be4-42dd-8257-db85f6f3fbe6
Statement successfully submitted.
Waiting for statement to be ready. Statement phase is PENDING.
Statement phase is COMPLETED.
Model 'vector_encoding' with version '1' created.
```

#### 3.  Now test the model to generate vector encoding against the real-time financial updates

```
select  * from `wealth-management`, lateral table (ml_predict('vector_encoding', investmentType));
```
![Flink SQL from CC GUI](/img/flinkVectorEncoding.png)

Very cool! We did vector embedding for the investment type, and it was pretty effortless.  Now we need to build some content to vector encode, we want to make it more like natural language.  Lets do this by concatenating fields.   

We may also want to enrich this data so we are breaking this down into a few steps.

**Trouble Shooting**   
If you are not getting data back it could be your API key check with your API provider and try a postman or a curl command.   
[https://platform.openai.com/docs/guides/embeddings](https://platform.openai.com/docs/guides/embeddings)

```
curl https://api.openai.com/v1/embeddings \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
    "input": "Your text string goes here",
    "model": "text-embedding-3-small"
  }'
```   
   

#### 3. Create a wealth-management-content table to hold a new content field
This table is backed up by a kafka topic with the same name for storage.

```
CREATE TABLE `wealth-management-content` (
    `client_id` INT,                 
    `investment_id`   INT,                         
    `investment_amount`        DOUBLE,                         
    `investmentType`  STRING,                      
    `riskLevel`         STRING,                      
    `investmentDuration`  STRING,                      
    `expectedReturn`    DOUBLE,                      
    `investmentDate`    STRING,                      
    `content`      STRING
) WITH (
  'value.format' = 'json-registry'
);
```

#### 4. Insert data into the wealth-management-content table
Lets put in a new field that seems more like a natual language description that we can send to the vector encoding service.  We will create a field called "content" which concatenates all the fields except investment_amount which is the amount of investment.  We can check investment details in a post processing step.
For now we need an investment description, the investment amount, client id and investment id.

```
insert into `wealth-management-content` (
	`client_id`,
	`investment_id`,
	`investment_amount`,
	`investmentType`, 
	`riskLevel`, 
	`investmentDuration`, 
	`expectedReturn`, 
	`investmentDate`, 
	`content`
)
select  `client_id`,
	`investment_id`,
	`investment_amount`,
	`investmentType`, 
	`riskLevel`, 
	`investmentDuration`, 
	`expectedReturn`, 
	`investmentDate`, 
	INITCAP(
		concat_ws(' ', 
			investmentType, 
			riskLevel, 
			investmentDuration, 
			expectedReturn, 
			investmentDate,
			', investment amount: '||cast(investment_amount as string),
			', client id: '||cast(client_id as string),	
			', investment id: '||cast(investment_id as string))
		) 
from `wealth-management`;
```

#### 5.  Create the wealth-management vector table
You will notice that the table will create a new " wealth-management-vector" kafka topic and that it creates the schema for us. The vector field is an array of floats.

```
CREATE TABLE `wealth-management-vector` (
    `client_id` INT,                 
    `investment_id`   INT,                         
    `investment_amount`        DOUBLE,                         
    `investmentType`  STRING,                      
    `riskLevel`         STRING,                      
    `investmentDuration`  STRING,                      
    `expectedReturn`    DOUBLE,                      
    `investmentDate`    STRING,                      
    `content`      STRING,
    `vector`      ARRAY<FLOAT>
) WITH (
  'value.format' = 'json-registry'
);
```

#### 6. Call the embedding function and insert the data into the wealth-management-vector table
This statement will call the vector embedding service and will run in the background in FlinkSQL. For testing or demo purposes you may wish to stop it as it will use tokens against the embedding service.
You can see this under the running querries tab

```
insert into `wealth-management-vector` select * from `wealth-management-content`,
lateral table (ml_predict('vector_encoding', content));
```
To view and stop running Flink SQL statements click the "running statements" tab   
![Flink SQL from CC GUI](/img/flinkStatements.png)

#### 7.  Create a sink connector for your favorite vector database
My favorite is MongoDB Atlas Vector Search. I created the `wealth-management-vector` table with additional fields because MongoDB can create a vector index on the vector field and still be able to query the rest of the fields like a regular database.  MongoDB combines the Operational Data Store (ODS) and the Vector search in one place!  The sink connector will create a document. There is a powerful synergy between Kafka, Confluent and MongoDB that we like to call Kafcongo.

Start by opening the Confluent Cloud and MongoDB Atlas clusters in the browser:   

[https://confluent.cloud](https://confluent.cloud) and [https://cloud.mongodb.com](https://cloud.mongodb.com)

Lets start by opening the [Confluent Cloud](https://confluent.cloud) console window.  Navigate to "Enviroments" and select the "default" environment where we created our basic cluster. Click on the basic cluster we used for this exercise and select "Connectors" on the left hand side menu.   

In the connectors console we will see a list of connectors (if we have any) and a button in the upper right that says "Add a Connector."  Click the add a connector button and search for MongoDB.  Lets select the fully managed "MongoDB Sink Connector" and we will begin configuration.
    
| Hands on Video: Creating a Fully Managed MongoDB Atlas Sink Connector in the Confluent Cloud  |
|----------------|
|[Click here to watch a 6 Minute Video on creating a mongoDB sink connector](https://www.youtube.com/watch?v=_9cvz7kmeCg&list=PLjGEA1Gur_Sm_1MRUwXFngYeAQ1wV7lah&index=6)|   
|<a href="https://www.youtube.com/watch?v=_9cvz7kmeCg&list=PLjGEA1Gur_Sm_1MRUwXFngYeAQ1wV7lah&index=6" target="video"></a>| 

Once the document is in MongoDB we create an index on the vector field for vector searches.  
[MongoDB Vector Index Example Here](https://www.mongodb.com/developer/products/atlas/building-generative-ai-applications-vector-search-open-source-models/)
   
And we are done!    
   
   


Another github on the power of Confluent with MongoDB Atlas showing how to perform legacy migration from relational databases like Oracle to a modern cloud native database like MongoDB Atlas is below.  The github is useful for trouble shooting connector data types with Single Message Transform (SMT):   
[https://github.com/brittonlaroche/Oracle-Confluent-MongoDB](https://github.com/brittonlaroche/Oracle-Confluent-MongoDB)

## Binance DataGen Connector
In addition to the financial data, we can also work with crypto coin data streams from Binance. To get started, we need to create the datagen connector and have it insert data into a `binance` topic.

Create a topic named `binance`
Set up the datagen connector for binance data... Add a new connector, select datagen, then use the link for "additional configuration"

Use the **binance** topic.
You will need an api key, use one if you have it if not create one and save the secret.
new connector --> datagen --> custom schema on configuration tab

Use the link for "additional configuration" and select JSON_SR for JSON and Schema Registry.

Now we need a custom schema for binance data, we will use the custom schema "Provide Your Own Schema" on configuration tab.

Get the binance schema that datagen will use to update random crypto coin data here:
[Binance Schema](https://raw.githubusercontent.com/jackgavardari/Confluent-Kafka-Vector/main/files/datagen/binanceSchema.json)

Paste it in the configuration tab.

The datagen connector will generate random binance data simulating a real connector from an operational data store receiving crypto coin updates.

You will need to adjust a couple of settings to get some of the data to display properly in the cloud gui. Go to the Datagen Connector we just created and under "settings" Set the following parameters:

`JSON output decimal format: BASE64`
`Schema Context: Default`
`Max interval between messages (MS): 25000`

**Transforms**
Add a new value single message transform.
For the value of the price_usd field set the spec to `price_usd:float64`

## Flink SQL for Binance Data

### First Steps
Flink can be accessed through the environments menu on the left-hand side of the Confluent Cloud interface. Select your environment, then navigate to the "Flink SQL" tab, which is located in the middle of the screen, instead of the default "Clusters" tab.

#### 1. Create a binance-content table to hold a new content field
This table is backed up by a kafka topic with the same name for storage.

```
CREATE TABLE `binance-content` (
    `coin_id` INT,
    `coin_name` STRING,
    `price_usd` DOUBLE,
    `market_cap_usd` DOUBLE,
    `volume_24h_usd` DOUBLE,
    `circulating_supply` DOUBLE,
    `change_24h_percent` DOUBLE,
    `content` STRING
) WITH (
  'value.format' = 'json-registry'
);
```

#### 2. Insert data into the binance content table
Let's put in a new field that seems more like a natural language description that we can send to the vector encoding service. We will create a field called "content" which concatenates all the fields.

```
insert into `binance-content` (
    `coin_id`,
    `coin_name`,
    `price_usd`,
    `market_cap_usd`,
    `volume_24h_usd`,
    `circulating_supply`,
    `change_24h_percent`,
    `content`
)
select
    `coin_id`,
    `coin_name`,
    `price_usd`,
    `market_cap_usd`,
    `volume_24h_usd`,
    `circulating_supply`,
    `change_24h_percent`,
    INITCAP(
        concat_ws(' ',
            coin_name,
            ', price: ' || cast(price_usd as string),
            ', market cap: ' || cast(market_cap_usd as string),
            ', volume 24h: ' || cast(volume_24h_usd as string),
            ', circulating supply: ' || cast(circulating_supply as string),
            ', change 24h: ' || cast(change_24h_percent as string))
    )
from `binance`;
```

#### 3. Create the binance vector table
You will notice that the table will create a new "binance_vector" kafka topic and that it creates the schema for us. The vector field is an array of floats.

```
CREATE TABLE `binance_vector` (
    `coin_id` INT,
    `coin_name` STRING,
    `price_usd` DOUBLE,
    `market_cap_usd` DOUBLE,
    `volume_24h_usd` DOUBLE,
    `circulating_supply` DOUBLE,
    `change_24h_percent` DOUBLE,
    `content` STRING,
    `vector` ARRAY<FLOAT>
) WITH (
  'value.format' = 'json-registry'
);
```

#### 4. Call the embedding function and insert the data into the binance-vector table
This statement will call the vector embedding service and will run in the background in FlinkSQL. For testing or demo purposes you may wish to stop it as it will use tokens against the embedding service.
You can see this under the running queries tab

```
insert into `binance-vector` select * from `binance-content`,
lateral table (ml_predict('vector_encoding', content));
```
To view and stop running Flink SQL statements click the "running statements" tab
![Flink SQL from CC GUI](/img/flinkStatements.png)

#### 5. Create a sink connector for your favorite vector database
You can follow the same steps as mentioned above for the wealth-management-vector table to create a sink connector for the binance-vector table.

## Using the ML_EVALUATE Function in Flink SQL

The `ML_EVALUATE` function in Flink SQL allows you to evaluate the performance of your machine learning models. This function can be used to calculate various evaluation metrics such as accuracy, precision, recall, F1 score, etc. The `ML_EVALUATE` function is particularly useful when you want to assess the quality of your model predictions.

### Example Usage of ML_EVALUATE

Let's assume you have a model that predicts whether an investment will be successful based on its features. You can use the `ML_EVALUATE` function to evaluate the performance of this model.

#### 1. Create a table to store the evaluation results

```
CREATE TABLE `investment_evaluation` (
    `client_id` INT,
    `investment_id` INT,
    `actual_label` STRING,
    `predicted_label` STRING,
    `evaluation_metric` STRING,
    `evaluation_value` DOUBLE
) WITH (
  'value.format' = 'json-registry'
);
```

#### 2. Insert data into the evaluation table using the ML_EVALUATE function

```
insert into `investment_evaluation`
select
    `client_id`,
    `investment_id`,
    `actual_label`,
    `predicted_label`,
    'accuracy' as `evaluation_metric`,
    ml_evaluate('accuracy', `actual_label`, `predicted_label`) as `evaluation_value`
from `investment_predictions`;
```

In this example, the `ML_EVALUATE` function calculates the accuracy of the model predictions and stores the results in the `investment_evaluation` table.

### Detailed Explanation of ML_EVALUATE Function

The `ML_EVALUATE` function in Flink SQL is used to evaluate the performance of machine learning models. It takes the following parameters:

1. `metric`: The evaluation metric to be calculated (e.g., 'accuracy', 'precision', 'recall', 'f1_score').
2. `actual_label`: The actual label of the data.
3. `predicted_label`: The predicted label generated by the model.

The function returns the calculated evaluation metric value.

#### Supported Evaluation Metrics

The `ML_EVALUATE` function supports the following evaluation metrics:

- `accuracy`: The ratio of correctly predicted instances to the total instances.
- `precision`: The ratio of correctly predicted positive instances to the total predicted positive instances.
- `recall`: The ratio of correctly predicted positive instances to the total actual positive instances.
- `f1_score`: The harmonic mean of precision and recall.

You can use the `ML_EVALUATE` function to calculate these metrics and assess the performance of your machine learning models in Flink SQL.

### Example Queries with ML_EVALUATE

Here are some example queries that use the `ML_EVALUATE` function to calculate different evaluation metrics:

#### Calculate Precision

```
insert into `investment_evaluation`
select
    `client_id`,
    `investment_id`,
    `actual_label`,
    `predicted_label`,
    'precision' as `evaluation_metric`,
    ml_evaluate('precision', `actual_label`, `predicted_label`) as `evaluation_value`
from `investment_predictions`;
```

#### Calculate Recall

```
insert into `investment_evaluation`
select
    `client_id`,
    `investment_id`,
    `actual_label`,
    `predicted_label`,
    'recall' as `evaluation_metric`,
    ml_evaluate('recall', `actual_label`, `predicted_label`) as `evaluation_value`
from `investment_predictions`;
```

#### Calculate F1 Score

```
insert into `investment_evaluation`
select
    `client_id`,
    `investment_id`,
    `actual_label`,
    `predicted_label`,
    'f1_score' as `evaluation_metric`,
    ml_evaluate('f1_score', `actual_label`, `predicted_label`) as `evaluation_value`
from `investment_predictions`;
```

These queries demonstrate how to use the `ML_EVALUATE` function to calculate different evaluation metrics and store the results in a table for further analysis.
