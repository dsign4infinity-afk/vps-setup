import requests
import subprocess
import sys

def check_service(name, url):
    print(f"Testing {name} at {url}...", end=" ")
    try:
        response = requests.get(url, timeout=5)
        if response.status_code in [200, 401, 404]: # Some services return 401/404 on root but are alive
            print("✅ ONLINE")
            return True
    except Exception as e:
        print(f"❌ OFFLINE ({e})")
        return False

def check_docker_container(name):
    print(f"Checking container {name}...", end=" ")
    result = subprocess.run(["sudo", "docker", "ps", "--filter", f"name={name}", "--format", "{{.Status}}"], capture_output=True, text=True)
    if "Up" in result.stdout:
        print("✅ RUNNING")
        return True
    else:
        print("❌ STOPPED/MISSING")
        return False

def main():
    print("\n--- Endurance CRM Setup Checkpoints ---\n")
    
    # Check 1: Infrastructure
    ip = "localhost" # Change to actual IP in production
    success = True
    
    success &= check_docker_container("dokploy")
    success &= check_docker_container("n8n")
    success &= check_docker_container("postgres")
    success &= check_docker_container("minio")
    
    # Check 2: Connectivity
    success &= check_service("n8n", f"http://{ip}:5678")
    success &= check_service("MinIO Console", f"http://{ip}:9001")
    
    print("\n" + "="*40)
    if success:
        print("🚀 ALL CHECKPOINTS PASSED!")
        print("The system is ready for Loop Engineering.")
    else:
        print("⚠️ SOME CHECKPOINTS FAILED.")
        print("Please check the logs using: docker logs [service_name]")
    print("="*40 + "\n")

if __name__ == "__main__":
    main()
