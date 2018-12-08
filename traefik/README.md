# Enable custom SSL with Traefik  

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

Step-4 (Uncomment below code inside traefik.toml)
```
    [entryPoints.https.tls]
      [[entryPoints.https.tls.certificates]]
      certFile = "/etc/traefik/ca_chain.crt"
      keyFile = "/etc/traefik/ca.key"
```

Step-5
```
docker run -d -p 80:80 -p 443:443 -v /var/run/docker.sock:/var/run/docker.sock -v $PWD/:/etc/traefik/ --network=traefik-network --name=traefik traefik:latest --api --docker
```


docker run -d --network=traefik-network -p 80:80 -p 443:443 -v /var/run/docker.sock:/var/run/docker.sock -v $PWD/docker/traefik:/etc/traefik -v $PWD/secrets/ssl:/etc/ssl --name=traefik traefik:latest --api --docker