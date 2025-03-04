# README

## SourceForge Upload Script

This Bash script automates the process of uploading files to a SourceForge project using `rsync` over SSH.

## Prerequisites

- Ensure you have an active SourceForge account.
- Replace `add_username` in the script with your actual SourceForge username.
- You must have SSH access to SourceForge configured (e.g., by adding your SSH key to your SourceForge account).
- `rsync` must be installed on your system.

## Installing `rsync`

To install `rsync`, use the following command based on your operating system:

- **Debian/Ubuntu**:
  ```bash
  sudo apt update && sudo apt install rsync -y
  ```
- **macOS (using Homebrew)**:
  ```bash
  brew install rsync
  ```
- **CentOS/RHEL**:
  ```bash
  sudo yum install rsync -y
  ```

## Setting Up SSH Keys

To set up SSH key authentication for SourceForge:

1. Generate an SSH key pair (if you haven't already):
   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```
2. Copy the public key to SourceForge:
   ```bash
   cat ~/.ssh/id_rsa.pub
   ```
   - Log in to SourceForge.
   - Go to "My Profile" > "SSH Keys".
   - Add the contents of `id_rsa.pub` to your SSH keys.
3. Test SSH connection:
   ```bash
   ssh -T your_username@frs.sourceforge.net
   ```
   If successful, you should see a welcome message.

## Usage

1. ```bash
   nano upload.sh
   ```
2. Replace `add_username` with your sourceforge account username:


3. Usage:
   ```bash
   ./upload_to_sourceforge.sh <local_path> <sourceforge-project> <release-directory>
   ```



### Parameters:
- `<local_path>`: The local file or directory you want to upload.
- `<sourceforge-project>`: The name of the SourceForge project.
- `<release-directory>`: The remote directory on SourceForge where the file(s) should be uploaded.

### Example:
```bash
./upload_to_sourceforge.sh ./myfile.zip myproject releases/v1.0
```

## How It Works
1. The script checks if the correct number of arguments is provided.
2. It assigns the arguments to variables and defines the SourceForge remote path.
3. It verifies if the local file or directory exists.
4. It uses `rsync` over SSH to upload the file(s) to SourceForge.
5. If the upload is successful, a confirmation message is displayed; otherwise, an error message is shown.

## Troubleshooting
- If the upload fails, ensure:
  - The local path exists.
  - Your SSH key is correctly set up for SourceForge.
  - You have the necessary permissions for the SourceForge project.
  - The `rsync` command is installed and accessible.

## License
This script is provided "as-is" without any warranty. Feel free to modify and distribute it as needed.

