# Enviromnent Setup for Telos Zero Development

/docs based on total 288
drwxr-xr-x  11 andre  staff   352B Feb 15 19:45 .
drwxr-xr-x@ 45 andre  staff   1.4K Feb 15 17:38 ..
drwxr-xr-x   4 andre  staff   128B Feb 15 17:50 .devcontainer
drwxr-xr-x  11 andre  staff   352B Feb 15 19:47 .git
-rw-r--r--   1 andre  staff   166B Feb 15 19:47 .gitignore
-rw-r--r--   1 andre  staff     0B Feb 15 19:28 README.md
drwxr-xr-x   3 andre  staff    96B Feb 15 18:10 contracts
-rwxr-xr-x@  1 andre  staff   2.2K Feb 15 19:45 fresh_env.sh
-rw-r--r--   1 andre  staff   124K Feb 15 19:49 nodeos.log
-rwxr-xr-x@  1 andre  staff   1.5K Feb 15 19:32 setup.sh
-rw-r--r--   1 andre  staff   195B Feb 15 19:45 wallet_password.txt

This repository contains scripts and configurations for setting up a development environment for Telos Zero, a blockchain platform. The environment includes necessary tools, dependencies, and configurations to facilitate smart contract development and testing.

## Getting Started
To set up your development environment, follow these steps:
1. Clone the repository:
   ```bash
   git clone https://github.com/telosnetwork/telos-dev.git
```bash
cd telos-dev
```

2. Run the setup script:
    ```bash
    ./setup.sh
    ```

3. For a fresh environment, execute:
    ```bash
    ./fresh_env.sh
    ```

## Project Structure

- **contracts/** - Smart contract source files
- **.devcontainer/** - Development container configuration
- **setup.sh** - Initial environment setup script
- **fresh_env.sh** - Fresh environment initialization script
- **nodeos.log** - Node output logs
- **wallet_password.txt** - Wallet credentials (keep secure)

## Requirements

- Docker (for devcontainer setup)
- Git
- Bash shell

## Notes

- Store `wallet_password.txt` securely and never commit to version control
- Review `.gitignore` before adding new files
- Check `nodeos.log` for blockchain node diagnostics

## Support

For issues or questions, refer to the [Telos Network documentation](https://docs.telos.net).