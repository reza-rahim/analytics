
### https://dgu2000.medium.com/working-with-self-signed-certificates-in-chrome-walkthrough-edition-a238486e6858

##### Step 1: Becoming your own CA
```
# Generate an RSA private key of size 2048
openssl genrsa -des3 -out rootCA.key 2048

# Generate a root certificate valid for ten years
openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 3650 -out rootCA.pem

# To check just created root certificate:
openssl x509 -in rootCA.pem -text -noout

```

#### Step 2: Creating a certificate request

```
# First, create a private key to be used during the certificate signing process:

openssl genrsa -out tls.key 2048

# Use the private key to create a certificate signing request:

## create the openssl.cnf 

```

#### Step 3: Signing the certificate request using CA

``` 
openssl x509 -req \
    -in tls.csr \
    -CA rootCA.pem \
    -CAkey rootCA.key \
    -CAcreateserial \
    -out tls.crt \
    -days 730 \
    -sha256 \
    -extfile openssl.cnf

## To verify that the certificate is built correctly:
openssl verify -CAfile rootCA.pem -verify_hostname none-1 tls.crt
```

#### Step 4: Adding CA as trusted store on mac

#### https://support.securly.com/hc/en-us/articles/206058318-How-to-install-the-Securly-SSL-certificate-on-Mac-OSX-
###   
```
# go to the finder on mac and search the Keychain Access 

```
