# coreController
This is a small bash script to turn off CPU cores by writing to the appropriate files.
It then checks to ensure the changes have been made before terminating.
# Usage
Put in /usr/local/bin/ with only root excecution permissions
ex: 
```bash
    # coreController <numCores>
    # coreController 2
```
