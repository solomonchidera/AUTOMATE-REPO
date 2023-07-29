# Simple Password Manager (Bash Script)

![Bash Logo](https://bashlogo.com/img/logo/png/full_colored_light.png)

## Introduction

Welcome to the Simple Password Manager - a secure and straightforward password manager implemented with a bash script! 🚀

This password manager uses GnuPG (gpg) for encryption, ensuring that your passwords are stored securely. It allows you to store and retrieve passwords for different services and accounts in an encrypted file.

## Features

1. **Secure Encryption**: The password manager uses GnuPG (gpg) with AES256 encryption, ensuring that your passwords are protected.

2. **Easy to Use**: With a simple command-line interface, you can store and retrieve passwords effortlessly.

3. **Minimal Dependencies**: The script uses built-in utilities and GnuPG, which are usually available on most Unix-like systems.

## Getting Started

1. Clone or download the `password_manager.sh` script to your local machine.

2. Make the script executable:

```bash
chmod +x password_manager.sh
```

3. Ensure that you have GnuPG (gpg) installed on your system. If not installed, you can install it via your package manager.

4. Usage:

    - **Storing a Password**:
      ```bash
      ./password_manager.sh --store <name>
      ```
      Replace `<name>` with a unique name for the password entry. The script will prompt you to enter the password.

    - **Retrieving a Password**:
      ```bash
      ./password_manager.sh --retrieve <name>
      ```
      Replace `<name>` with the name you used when storing the password. The script will decrypt and display the password.

## Example

Let's see an example of how to use the password manager:

1. To store a password for your Gmail account:
   ```bash
   ./password_manager.sh --store gmail
   Enter password for 'gmail': mySecretPassword123
   Password saved!
   ```

2. To retrieve the password for your Gmail account:
   ```bash
   ./password_manager.sh --retrieve gmail
   Password for 'gmail': mySecretPassword123
   ```

## Security Considerations

- Always keep your GnuPG passphrase secure and never share it with others.

- Ensure the `PASSWORD_FILE` location (default: `~/.passwords`) is protected from unauthorized access.

- Regularly back up the `PASSWORD_FILE` to a secure location.

- Consider using a strong passphrase for GnuPG and your user account.

## Contribution

Contributions and improvements to the password manager are welcome! Feel free to open issues or submit pull requests.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

Huge thanks to GnuPG developers and the bash community for making this simple yet powerful password manager possible!

Happy secure password managing! 😄🔐
