# Enable SSL 

Step-1 Execute below command on your local machine. It will generate two files ca.key & ca.csr
````
openssl req -new -newkey rsa:2048 -nodes -keyout ca.key -out ca.csr  
````

Step-2
````
Copy content of ca.csr to the certificate provider's ssl generation box and submit. Follow next steps there to veryify the csr and after verification you will be getting the certificates into your main box.
````

Step-3 (Concatenate ca.crt which was produced earlier in your local machine and the *.ca_bundle which you got from SSL provider )
````
cat ca.crt ca.ca-bundle >>ca_chain.crt 
````

Step-4 (Update traefik.toml)
```
defaultEntryPoints = ["http", "https"]
[entryPoints]
  [entryPoints.http]
  address = ":80"
    [entryPoints.http.redirect]
    entryPoint = "https"
  [entryPoints.https]
  address = ":443"
    [entryPoints.https.tls]
      [[entryPoints.https.tls.certificates]]
      certFile = "/etc/traefik/ca_chain.crt"
      keyFile = "/etc/traefik/ca.key"
```

Step-5
```
docker run -d -p 80:80 -p 443:443 -v /var/run/docker.sock:/var/run/docker.sock -v $PWD/:/etc/traefik/ --network=traefik-network --name=traefik traefik:latest --api --docker
```


Note : For this project you just have uncomment all contents inside traefik.toml and replace the ca.key and ca_chain.crt inside travis/traefik dir with your certificates. Don't forget to encrypt your ca.key before pushing it to github 
