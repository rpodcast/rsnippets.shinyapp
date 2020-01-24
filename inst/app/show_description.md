**Residual Snippets** is an informal, unedited, and free-flowing audio series from [Eric Nantz](https://github.com/rpodcast).  If you enjoy hearing quick takes from a data scientist on their journey to blend innovative uses of open-source technology, contributing back to their brilliant communities, and juggling the curveballs life throws at them, this series is for you!

### Acknowledgements

I have been wanting to produce something like this for a long time, and I've been able to finally pull it off thanks to massive advancements in key open-source projects, innovative backend services, and excellent ideas / resources from the community.  In no particular order:

* __Alan Pope__ ([`@popey`](https://twitter.com/popey)) is a developer advocate at Canonical as well as a highly entertaining podcast host for the [Ubuntu Podcast](https://ubuntupodcast.org) and [Ask Error](https://error.show) shows. In 2019, he launched a new experiment called [Telecast with Popey](https://t.me/telecastwithpopey) where he uses voice memos recorded on Telegram to distribute short podcast-like episodes to his community.  View more background on [this post](https://twitter.com/popey/status/1160170988283338752).
* [__Mark Richman__](https://linuxacademy.com/blog/behind-the-scenes/employee-spotlight-mark-richman/) (training architect at [Linux Academy](https://linuxacademy.com)) authored an excellent course on automating AWS Lambda workflows that integrate with other AWS services (such as speech transcription and media transcoding) with python and the boto3 module. I was able to adapt many of the course examples to power the backend of __Residual Snippets!__
* The hosts from [Jupiter Broadcasting](https://www.jupiterbroadcasting.com/), [Destination Linux](https://destinationlinux.org/), and more who not only entertain me during my daily commutes, but have taught me so much about the worlds of linux and the awesome communities that build such cool software for me to use!

### Technical Details

This application was created using the [R](https://r-project.org) statistical computing language.  Key packages that make this possible include:

* [`{shinyMobile}`](https://rinterface.github.io/shinyMobile/) by __David Granjon__ ([`@divadnojnarg`](https://twitter.com/divadnojnarg)) (part of the [RinteRface](https://rinterface.com/) collection).  This is the first package in the R ecosystem that empowers users like me to creat a mobile-first app!
* [`{wavesurfer{}`](https://github.com/Athospd/wavesurfer) by __Athos Petri Damiani__ which wraps the [`wavesurfer.js`](https://wavesurfer-js.org/) JavaScript library, enabling this application to play the __Residual Snippet__ episodes!

The backend infrastructure leverages the following Amazon Web Services: S3 storage, DynamoDB, Amazon Transcribe, and Elastic Transcoder. In addition, the episodes are recorded using the Telegram messenger's voice memo functionality and distributed to the backend infrastructure via their API.  A detailed writeup is to come!
