
curl --location --request POST '10.100.3.66:5000/v1/operator/register' \
--header 'Content-Type: application/json' \
--data '{
    "name": "shopee_my_vgg_encoder",
    "addr": "psoperator/vgg16-encoder:latest",
    "author" :"sunny5156",
    "type":"encoder",
    "description": "vgg16 encoder for shopee",
    "version": "0.1.0"
}'


curl --location --request POST '10.100.3.66:5000/v1/operator/shopee_my_vgg_encoder/instances/shopee_my_vgg_instance' \
--header 'Content-Type: application/json'





curl --location --request POST '10.100.3.66:5000/v1/pipeline/shopee_my_pipeline' \
--header 'Content-Type: application/json' \
--data '{
    "description":"pipeline shopee sg",
    "processors": [],
    "encoder": {
        "name": "shopee_my_vgg_encoder",
        "instance":"shopee_my_vgg_instance"
    }
}'


curl --location --request POST '10.100.3.66:5000/v1/application/shopee_my_search' \
--header 'Content-Type: application/json' \
--data '{
    "fields":{
        "images": {
            "type": "pipeline",
            "value": "shopee_my_pipeline"
        },
        "product_no": {
            "type": "string",
            "value": "string"
        },
        "platform_url": {
            "type": "string",
            "value": "string"
        },
        "product_name": {
            "type": "string",
            "value": "string"
        }
    },
    "s3Bucket": "shopee-my-s3"
}'
