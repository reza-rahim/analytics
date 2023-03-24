### https://dgu2000.medium.com/working-with-self-signed-certificates-in-chrome-walkthrough-edition-a238486e6858

##### Step 1: Becoming your own CA
```
# Generate an RSA private key of size 2048
openssl genrsa -des3 -out CA_cert.key 2048

# Generate a root certificate valid for ten years
openssl req -x509 -new -nodes -key CA_cert.key -sha256 -days 3650 -out CA_cert.crt

# To check just created root certificate:
openssl x509 -in CA_cert.crt  -text -noout
```

#### Step 2: Creating a certificate request

```
# First, create a private key to be used during the certificate signing process:

openssl genrsa -out server.key 2048

# Use the private key to create a certificate signing request:
openssl req -new -key server.key -out server.csr

## create the openssl.cnf 

```

#### Step 3: Signing the certificate request using CA

``` 
openssl x509 -req \
    -in server.csr \
    -CA CA_cert.crt \
    -CAkey CA_cert.key \
    -CAcreateserial \
    -out server.crt \
    -days 730 \
    -sha256 \
    -extfile openssl.cnf

## To verify that the certificate is built correctly:
openssl verify -CAfile CA_cert.crt -verify_hostname node-1 server.crt
```

#### Step 4: Adding CA as trusted store on mac

#### https://support.securly.com/hc/en-us/articles/206058318-How-to-install-the-Securly-SSL-certificate-on-Mac-OSX-
###   
```
# go to the finder on mac and search the Keychain Access 

```

##### Step 5: Adding CA to Ubuntu server
```
cp CA_cert.crt  /usr/local/share/ca-certificates/

update-ca-certificates
```
