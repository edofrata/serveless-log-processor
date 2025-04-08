import boto3
import os
from datetime import datetime, timezone


BUCKET_NAME = "serveless-log-demo-edofrata"
REGION = "eu-north-1"


#initialize S3 client
s3 = boto3.client("s3", region_name=REGION)

def generate_dummmy_log():
    log_content = """ [INFO] System boot complete
    [INFO] Processing started
    [WARNING] Unusual latency detected
    [ERROR] Database timeout
    [ERROR] Failed to connect to inventory service
    [INFO] Processing complete"""
    
    now = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H-%M-%S")
    filename = f"log_{now}.log"
    filepath = os.path.join("scripts/logs/", filename)
    
    with open(filepath, "w") as f:
        f.write(log_content)
        
    return filename, filepath




def upload_log_t_s3(filename,filepath):
    try:
        s3.upload_file(filepath,
                       BUCKET_NAME,
                       f"logs/{filename}")
        print(f"File uploaded successfully to s3://{BUCKET_NAME}/logs/{filename}")
    except Exception as e:
        print(f"Error uploading file to s3: {e}")
    
if __name__ == "__main__":
    # filename, filepath = generate_dummmy_log()
    # upload_log_t_s3(filename,filepath)
    filename = "log_2025-04-08T13-58-50.log"
    filepath = "scripts/logs/" + filename
    upload_log_t_s3(filename,filepath)  