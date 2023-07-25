# hugo extended

Contains NodeJS, yarn, pnpm, npm  

latest docker container contains:


Specific tag versions follow this definition:  
`hugo version`-`node vesion`-`go vesion`

# To use

Run the following in your hugo directory: `docker run -v .:/home/app -ti --network=host betterweb/hugo:latest`  
To also host locally: `docker run -p 1313:1313 -v .:/home/app -ti --network=host betterweb/hugo:latest`  
