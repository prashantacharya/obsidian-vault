Tags: [[AWS]], [[Cloud Computing]], [[DevOps]]

**On Premise Storage**
Stored on physical location at your company

**Cloud Storage**
Stored in the cloud maintained by a cloud provider like AWS

**Benefits of cloud storage**

1. Cost efficient
2. Secure
3. Accessible to multiple users
4. Scalable
5. Managed so don't have to worry about servers
6. Backed up

**Types of cloud storage**

1. **Block storage**
	- Stored on a device in a fixed-sized blocks
2. **File storage**
	- Stored in a shared file system so that users, applications and services access data in it
3. **Object Storage**
	- Files are stored as objects based on metadata and attributes

**Choosing the right storage type**
***Block storage*** provides high availability and durability so enterprise applications can use this. They also have low latency and high input/output operations per second and throughput performance. They are capable of scaling without workload disruption.

***Object Storage*** can be used to create cloud native applications. With this, we can upload any amount of data and access it anywhere to deploy applications faster and reach more users.


Comparision of various AWS services

| **Feature**         | **EBS**                            | **EFS**                       | **S3**                          |
| ------------------- | ---------------------------------- | ----------------------------- | ------------------------------- |
| **Type of Storage** | Block Storage                      | File System                   | Object Storage                  |
| **Access**          | Single EC2 Instance                | Multiple EC2 Instances        | HTTP-based API                  |
| **Use Cases**       | Databases, Virtual Machines        | Shared Workloads, Web Hosting | Backups, Static Websites, Logs  |
| **Scalability**     | Pre-defined Size (Manually Resize) | Automatically Scales          | Virtually Unlimited             |
| **Cost**            | Pay for provisioned capacity       | Pay for used storage and I/O  | Pay for storage, requests, data |


### Amazon S3 
[[Amazon S3]] 

Files are backed up in 3 availability zones and connected in a way that there is low latency to access these files.

S3 accepts data of all file types. Each file can be of maximum 5 terabytes.

The file object contains data and metadata. Metadata + data + key serves as unique ID. Bucket Name + Key + Version ID uniquely identifies an object.

Two types of storage
1. Active storage
2. Archive storage

**Amazon S3 storage classes**
1. Amazon S3 Standard: For most active and frequently accessed data
2. Amazon S3 Standard - Infrequent Access: Accessed less frequently but data that must be highly available on request
3. Amazon S3 One Zone - Infrequent Access: Accessed less frequently and for data that can be recreated if it is lost
4. Amazon S3 Glacier Flexible Retrieval: Archived data that can be retrieved in a few hours
5. Amazon S3 Glacier Deep Archive: Archiving data that is not accessed often. Retrieval time is 12 hours.
6. Amazon S3 Intelligent - Tiering: If unsure, use this.