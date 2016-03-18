# init SSH
SSH_PUBLIC_KEY="$HOME/.ssh/id_rsa.pub"

mkdir -p $HOME/.ssh
if [ ! -f "$SSH_PUBLIC_KEY" ]; then
  echo "SSH key does not exist. Generating it..."
  ssh-keygen -t rsa -C "valerii.vasin@gmail.com"
else
  echo 'SSH key exists. Continue...'
fi
chmod 600 $HOME/.ssh/*
chmod 700 $HOME/.ssh

cat $SSH_PUBLIC_KEY | pbcopy;
echo "SSH key has been copied to clipboard.";
echo "Please add it to yours Github/Bitbucket public keys."
echo
# Links to Github/Bitbucket pages to add public key
echo "Github: https://github.com/settings/keys"
echo "Bitbucket: https://bitbucket.org/account/user/valeriivasin/ssh-keys/"
