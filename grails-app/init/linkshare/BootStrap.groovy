package linkshare
import linkshare.SeriousnessEnum
import linkshare.VisibilityEnum
class BootStrap {

    def init = { servletContext ->
        User u=new User()
        u.firstName="Vivek"
        u.lastName="Kumar"
        u.email="VivekKumar@gmail.com"
        u.userName="VivekRay"
        u.password=12345678
        u.isAdmin=true
        u.photo="profilePhoto/VivekRay.jpg"
        u.save(flush:true,failOnError:true)

        User u1=new User()
        u1.firstName="Robert"
        u1.lastName="Pattinson"
        u1.email="RobertPattinson@gmail.com"
        u1.userName="Batman"
        u1.password=12345678
        u1.photo="profilePhoto/Batman.jpeg"
        u1.save(flush:true,failOnError:true)

        User u2=new User()
        u2.firstName="Robert"
        u2.lastName="Downey Junior"
        u2.email="Jarvis3000@gmail.com"
        u2.userName="Ironman"
        u2.password=12345678
        u2.photo="profilePhoto/Ironman.png"
        u2.save(flush:true,failOnError:true)

        User u3=new User()
        u3.firstName="Dwayne"
        u3.lastName="Jhonson"
        u3.email="DwayneJhonson@gmail.com"
        u3.userName="BlackAdam"
        u3.password=12345678
        u3.photo="profilePhoto/BlackAdam.jpeg"
        u3.save(flush:true,failOnError:true)

        User u4=new User()
        u4.firstName="Henry"
        u4.lastName="Cavill"
        u4.email="HenryCavill@gmail.com"
        u4.userName="Superman"
        u4.password=12345678
        u4.photo="profilePhoto/Superman.png"
        u4.save(flush:true,failOnError:true)

        Topic t=new Topic()
        t.name="Artificial Intelligence and Machine Learning"
        t.createdBy=u1
        t.visibility=VisibilityEnum.Public
        t.save(flush:true,failOnError:true)

        Topic t1=new Topic()
        t1.name="Nuclear fusion energy"
        t1.createdBy=u2
        t1.visibility=VisibilityEnum.Public
        t1.save(flush:true,failOnError:true)

        Topic t2=new Topic()
        t2.name="OpenAI"
        t2.createdBy=u3
        t2.visibility=VisibilityEnum.Public
        t2.save(flush:true,failOnError:true)

        Topic t3=new Topic()
        t3.name="Increasing case of corona virus"
        t3.createdBy=u1
        t3.visibility=VisibilityEnum.Public
        t3.save(flush:true,failOnError:true)


        Subscription s=new Subscription()
        s.user=u
        s.topic=t3
        s.seriousness= SeriousnessEnum.CASUAL
        s.save(flush:true,failOnError:true)

        Subscription s1=new Subscription()
        s1.user=u1
        s1.topic=t2
        s1.seriousness= SeriousnessEnum.CASUAL
        s1.save(flush:true,failOnError:true)

        Subscription s2=new Subscription()
        s2.user=u2
        s2.topic=t1
        s2.seriousness= SeriousnessEnum.CASUAL
        s2.save(flush:true,failOnError:true)

        Subscription s3=new Subscription()
        s3.user=u
        s3.topic=t
        s3.seriousness= SeriousnessEnum.CASUAL
        s3.save(flush:true,failOnError:true)

        Subscription s4=new Subscription()
        s4.user=u4
        s4.topic=t
        s4.seriousness= SeriousnessEnum.CASUAL
        s4.save(flush:true,failOnError:true)

        Subscription s5=new Subscription()
        s5.user=u1
        s5.topic=t
        s5.seriousness= SeriousnessEnum.CASUAL
        s5.save(flush:true,failOnError:true)

        Subscription s6=new Subscription()
        s6.user=u3
        s6.topic=t2
        s6.seriousness= SeriousnessEnum.CASUAL
        s6.save(flush:true,failOnError:true)

        Subscription s7=new Subscription()
        s7.user=u1
        s7.topic=t3
        s7.seriousness= SeriousnessEnum.CASUAL
        s7.save(flush:true,failOnError:true)


        LinkResource lr1=new LinkResource()
        lr1.url="https://timesofindia.indiatimes.com/coronavirus"
        lr1.createdBy=u
        lr1.description="ToI Article"
        lr1.topic=t3
        lr1.save(flush:true,failOnError:true)

        LinkResource lr2=new LinkResource()
        lr2.url="https://www.linkedin.com/pulse/openais-revolutionary-breakthrough-creating-language-models-madhani"
        lr2.createdBy=u1
        lr2.description="Recent Research"
        lr2.topic=t2
        lr2.save(flush:true,failOnError:true)

        LinkResource lr3=new LinkResource()
        lr3.url="https://www.bbc.com/news/science-environment-63950962"
        lr3.createdBy=u2
        lr3.description="Break through in field of nuclear energy"
        lr3.topic=t1
        lr3.save(flush:true,failOnError:true)


        LinkResource lr4=new LinkResource()
        lr4.url="https://www.forbes.com/sites/robtoews/2020/10/12/the-next-generation-of-artificial-intelligence/"
        lr4.createdBy=u
        lr4.description="Next Generation of AI"
        lr4.topic=t
        lr4.save(flush:true,failOnError:true)

        LinkResource lr5=new LinkResource()
        lr5.url="https://www.nibusinessinfo.co.uk/content/risks-and-limitations-artificial-intelligence-business"
        lr5.createdBy=u4
        lr5.description="limitations of AI"
        lr5.topic=t
        lr5.save(flush:true,failOnError:true)

        def resource=Resource.getAll()
        resource.each {res->
            def subscriber=Subscription.findAllByTopic(res.topic).user
            subscriber.each {it->
                if(it.id==res.createdBy.id){
                    def read=new ReadingItem(user: it,resource: res,isRead: true)
                    read.save(flush:true,failOnError:true)
                }else{
                    def read=new ReadingItem(user: it,resource: res)
                    read.save(flush:true,failOnError:true)
                }
            }
        }

        ResourceRating rr1=new ResourceRating(score:3,resource: lr5,user: u)
        rr1.save(flush:true,failOnError:true)
        ResourceRating rr2=new ResourceRating(score:4,resource: lr3,user: u2)
        rr2.save(flush:true,failOnError:true)
        ResourceRating rr3=new ResourceRating(score:2,resource: lr1,user: u3)
        rr3.save(flush:true,failOnError:true)
        ResourceRating rr4=new ResourceRating(score:3,resource: lr2,user: u1)
        rr4.save(flush:true,failOnError:true)
        ResourceRating rr5=new ResourceRating(score:1,resource: lr5,user: u4)
        rr5.save(flush:true,failOnError:true)
        ResourceRating rr6=new ResourceRating(score:5,resource: lr2,user: u)
        rr6.save(flush:true,failOnError:true)
        ResourceRating rr7=new ResourceRating(score:4,resource: lr3,user: u2)
        rr7.save(flush:true,failOnError:true)
    }
    def destroy = {
    }
}
