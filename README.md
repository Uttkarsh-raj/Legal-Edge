# LegalEdge
<br>
<h3 align ="center">Problem Statement </h3>
 Many individuals face challenges when seeking legal advice and guidance. They often struggle to find reliable and convenient access to lawyers, encounter difficulties in scheduling appointments, and lack a platform to engage in meaningful discussions with legal professionals. 

<h3 align ="center">LegalEdge</h3>

<p align="center"> Our goal is to address these challenges by developing a application that connects users with lawyers, facilitates meaningful interactions, and streamlines the appointment scheduling process. Through our app, users will be able to post legal questions or scenarios, receive opinions and advice from verified lawyers, and schedule appointments for further consultation giving them a "LEGAL EDGE".</p>

<p align="center">
  <img src="https://github.com/hackman-v6/201CreatedChaos/assets/101019545/d37742e9-7780-47fa-bc7e-af851c5f4ab6" />
</p>


<!--TABLE OF CONTENTS-->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a> 
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a> 
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
  </details>

  There are many great README templates available on GitHub;however, I didn't find one that really suited my needs so I created this one. I wanted to create a README template which satisfies the project.
  
Here's why:

- A project that solves a problem and helps others.
- One shouldn't be doing the same task over and over like creating a README from scratch.
- You should implement DRY principles to the rest of your life :smile:

Of course, no one template will serve all projects since your needs may be different. So i'll be  adding more in the near future.You may also suggest changes by forking this repo and creating a pull request or opening issue. Thanks to all the people have contributed to expanding this template!

<!--About the Project-->
  
## About The Project

LegalEdge is a flutter application which uses firebase to sign in users and create a new account. With the help of our Node.js backend we have integrated the functionalities of registering users, lawyers , creating posts , liking a post and also commenting on the posts. 
  

### Built With

This section should list any major frameworks/libraries used to bootstrap your project.Leave any add-ons/plugins for the acknowledgement section. Here are a few examples.

![image](https://user-images.githubusercontent.com/106571927/206698131-0921a8dc-5ea9-46f7-a68c-ad1c717a0ff1.png)

![image](https://user-images.githubusercontent.com/106571927/206698233-ac9c9c2b-0d7d-49b9-8995-1c0761329324.png)

![download](https://user-images.githubusercontent.com/106571927/206837964-7e65a5b9-0cb4-4f9a-837c-5c341e6a933d.png)

<img height="200px" src="https://usefulangle.com/img/thumb/nodejs.png"/>

<img height="200px" src="https://www.openlogic.com/sites/default/files/image/2021-06/image-blog-openlogic-what-is-mongodb.png"/>



<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!--GETTING STARTED-->

## Getting Started

We recommend creating a new flutter project using 'flutter create --org project_name' ,
which sets up a default application setup automatically. To create a project, run the followingf command in cmd after downloading and sucessfully installing flutter:

'flutter create --org project_name'

### Prerequisites

After the installation is complete:

In the main file try running with the run without debugging:

![Screenshot (13)](https://user-images.githubusercontent.com/106571927/206700482-3ca687cf-49ef-40e8-b8e4-3f56503153c8.png)

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### Installation 

Below is an example of how you can instruct your audience on installing and setting up your app.This template doesn't rely on any external dependencies or services.

1.Clone the repo 

git clone https://github.com/Uttkarsh-raj/Legal-Edge


2.Install the packages 

flutter pub get


<p align="right">(<a href="#readme-top">back to top</a>)</p>


##### Setup backend
Setup the repo in your local system
```
git clone https://github.com/Uttkarsh-raj/Legal-Edge.git
```
Install the dependencies and start the server
```
npm install
node index
```
## Routes

### 1. LAWYERS
#### GET '/api/v1/lawyers' : 
* Responds as {success:true,lawyers:Array}

#### GET /api/v1/lawyer/:id 
* Responds with {success:true : lawyer:Object}

#### POST '/api/v1/lawyer/register' 
* Send {name,address,city,regNo,cases,courts,experience,contact,desc,email} as Request body
* Responds as {success:true, lawyer:Object}

### 2. USERS

#### GET '/api/v1/users' 
* Responds as {success:true,users:Array}

#### GET /api/v1/user/:id 
* Responds with {success:true : user:Object}

#### POST '/api/v1/lawyer/register' 
* Send {name,email,contact,role} as Request body
* Responds as {success:true, msg:"comment added successfully"}
* Responds as

### 3. POSTS

#### POST /api/v1/post/create
* Send {title,desc,user} as the Request body
* Responds with {success:true,message:"Comment added successfully"}
* Responds as {"error": "User Id required"} in case of missing body data
#### GET /api/v1/posts
* Responds with {success:true,posts:Array}
#### GET /api/v1/post/:id
* Accepts the post _id from Request Parameters and responds with {success:true,post:Object}
#### POST /api/v1/post/addComment
* Request body contains  {postId,commentDesc,userEmail}
* Responds with {success:true,message:"Comment Added Successfully"}
### 3. APPOINTMENTS

#### POST /api/v1/appointment/request/create
* Send user,desc,lawyer as Request body
* Responds as {success:true,message:"Request added to queue"}
#### GET  /api/v1/appointment/requests/pending 
* Request body should contain {lawyer} i.e. Lawyer ObjectId
* To get pending the requests in the Queue
* Responds as {success:true,requests}
* requests array may be null in case of no pending requests
#### GET  /api/v1/appointment/requests/accepted 
* Request body should contain {lawyer} i.e. Lawyer ObjectId
* To get the accepted requests in the Queue
* Responds as {success:true,requests}
* requests array may be null in case of no accepted requests
#### GET  /api/v1/appointment/requests/all 
* Request body should contain {lawyer} i.e. Lawyer ObjectId
* To get all the requests in the Queue
* Responds as {success:true,requests}
* requests array may be null in case of no requests
#### PATCH /api/v1/appointment/requests/action
* Request body should contain {lawyer,request,status}
* request id requestId(check JSON object)
* lawyer is lawyer id(Object Id)
* status should be ['accepted','cancel'] default:"pending"


<!--USAGE EXAMPLES-->

## Usage

### Screenshots:

Open the App:

<img src="https://github.com/hackman-v6/201CreatedChaos/assets/101019545/3da2e26e-1e4d-4c29-bc36-a0d4cb3a3e93" alt="img"></img>


Onboarding Screens:

<img width="300" src="https://github.com/hackman-v6/201CreatedChaos/assets/101019545/d5f32569-d6d2-481a-870b-98aeb9695e89"></img>
<img width="300" src="https://github.com/hackman-v6/201CreatedChaos/assets/101019545/7958468a-6612-4579-8b39-a6a18ce43298"></img>
<img width="300" src="https://github.com/hackman-v6/201CreatedChaos/assets/101019545/cf37c60a-89c8-4346-9f9d-a3e7f4e3f7ec"></img>

### Welcome Screens:

<center>
<img width="300" src="https://github.com/hackman-v6/201CreatedChaos/assets/101019545/a630fdec-4f8d-4b8f-ab93-1c1060629c78"></img>
</center>


### ScreenShots: 
<img width="320" src="https://github.com/hackman-v6/201CreatedChaos/assets/101019545/7b4a1605-9116-4cb9-871f-19c66afcd685"></img>
<img width="320" src="https://github.com/hackman-v6/201CreatedChaos/assets/101019545/43bc5671-aba1-483d-a9dd-809817d67d23"></img>
<img width="320" src="https://github.com/hackman-v6/201CreatedChaos/assets/101019545/b187ebf8-f773-4d7b-b6cf-053d56c551d7"></img>
<img width="320" src="https://github.com/hackman-v6/201CreatedChaos/assets/101019545/eb5d476c-cd65-4315-bc04-62a2b8f7ba0b"></img>
<img width="320" src="https://github.com/hackman-v6/201CreatedChaos/assets/101019545/76a3db42-38c1-437b-bf14-b6d21404110e"></img>






<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->

## Roadmap

- [x] Add Changelog
- [x] Add back to top links
- [x] Add Additional Templates w/ Examples
- [ ] Add "components" document to easily copy & paste sections of the readme
- [ ] Multi-language Support
  - [ ] Hindi
  - [ ] English

  
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!--CONTRIBUTING-->

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire ,and create.Any contributions you make are *greatly appreciated*.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## License


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->

## Contact
Manish Madan - https://github.com/ManishMadan2882 <br>
Uttkarsh Raj - https://github.com/Uttkarsh-raj <br>
Aditya khattri - https://github.com/adityakhattri21

Project Link: https://github.com/hackman-v6/201CreatedChaos

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->

## Acknowledgments

Use this space to list resources you find helpful and would like to give credit to. I've included a few of my favorites to kick things off!

- [Choose an Open Source License](https://choosealicense.com)
- [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
- [Malven's Flexbox Cheatsheet](https://flexbox.malven.co/)
- [Malven's Grid Cheatsheet](https://grid.malven.co/)
- [Img Shields](https://shields.io)
- [GitHub Pages](https://pages.github.com)
- [Font Awesome](https://fontawesome.com)
- [React Icons](https://react-icons.github.io/react-icons/search)
- 

<p align="right">(<a href="#readme-top">back to top</a>)</p>
