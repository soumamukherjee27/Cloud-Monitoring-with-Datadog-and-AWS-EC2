# Cloud Monitoring with Datadog and AWS EC2

## Overview
This project demonstrates how to set up **Datadog monitoring** for AWS EC2 instances. It includes **agent installation, metrics collection, log management, and alert configuration** to ensure robust cloud observability.

## Features
- **Datadog Agent Installation** on AWS EC2
- **Real-time Monitoring & Metrics Collection**
- **Log Management & Analysis**
- **Alerting & Notification Configuration**
- **Integration with AWS Services (EC2, CloudWatch, S3, Lambda, etc.)**

## Prerequisites
Before starting, ensure you have:
- An **AWS account** with an active EC2 instance
- A **Datadog account** (Sign up at [Datadog](https://www.datadoghq.com/))
- Basic knowledge of **Linux, AWS CLI, and Datadog setup**

## Installation Steps

### 1. Install Datadog Agent on EC2
Run the following commands to install the **Datadog Agent** on your EC2 instance:

```bash
DD_API_KEY=<YOUR_DATADOG_API_KEY>
DD_AGENT_MAJOR_VERSION=7
bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"
