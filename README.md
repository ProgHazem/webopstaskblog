# To run project. open project folder and open your terminal for project path then type 🔽😄
    docker compose up

# API Blog with Devise auth token which using JWT 🔥
* first to run this project must run bundle install then there api that task want
    You can see the collection postman and import it in your postman application to test apis.
    * ### sing up  ®️
        this api must be post and body contains email , password, name and image with validation email must be unique and valid email and name must be exsist and password must be minumam 8 character.

        http://localhost:3000/auth 
    
    * ### sing in 🔒
        this api must be post and body contains emal and password.

        http://localhost:3000/auth/sing_in
        
    ## the upcoming api using authentication and but header which contains 3 authenticate  👌 👌 👌
        ** access-token  client uid
    
    ## posts
        
    * ### All post 
        this api must be get
        
        http://localhost:3000/posts
    * ### show post 
        this api must be post and id must be related to current user post.

        http://localhost:3000/posts/:id
      
    * ### create post 
        this api must be post and send body must be have title , body and author and tags at least one

        http://localhost:3000/posts 
        
    * ### update post 
        this api must be put and :id related to current user post.

        http://localhost:3000/posts/:id
    
    * ### delete post 
        this api must be delete and :id related to current user post.

        http://localhost:3000/posts/:id 
                 
    ## comments
    
    * ### create comment 
        this api must be post and send body for comment

        http://localhost:3000/posts/:post_id/comments 
        
    * ### update comment 
        this api must be put and send body for comment and id must be related to current user comment. post_id is related to valid id post

        http://localhost:3000/posts/:post_id/comments/:id 
    
    * ### delete comment 
        this api must be delete and id must be related to current user comment. post_id is related to valid id post.

        http://localhost:3000/posts/:post_id/comments/:id 
    
    ## tags
    * ### update post 
        this api must be put and send body and id must be related to current user tags. post_id is related to valid id post.

        http://localhost:3000/posts/post_id/tags/:id 
             
    
    ## test case will run when run docker-compose up
    TO run the test run: 

    ```rspec --format documentation```
    
       
    To start Sidekiq when the server boots up, we need to create a symlink. In order to do so, run the below command.
    
    To start the Sidekiq service.

    ```bundle exec sidekiq sudo systemctl enable sidekiq.service```
    
    sudo service sidekiq start systemctl {start,stop,restart} sidekiq
    You can check the system log for errors.
    
    ```sudo cat /var/log/syslog```

    Check if Sidekiq started by
    
    ```sudo ps aux | grep sidekiq```

    If the Sidekiq is running you can see something like…
    
    user 2609 0.7 3.3 1352776 136960 ? Ssl 06:18 0:15 sidekiq 5.2.7 application-name[0 of 25 busy]
    To reload daemon
    
    ```sudo systemctl daemon-reload```