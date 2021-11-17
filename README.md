# Finish This

A web-app to manage and help finish projects.  
Pretty straightfoward and simple rails routes with 3 regular models and a Devise User model.  
Users have Projects, which have Sections, which have Tasks.  

Projects, sections and tasks are all CRUDable but "completion" is not yet possible.  

Organizing the routes for this app was quite a learning experience, resourceful nesting is only good for a single level deep so I used 2 separate nested resourceful routes.


This was also my first project using Tailwind and I have to admit it's very nice!!  
It speeds up styling so much and the responsiveness and animations out of the box are amazing!

## Roadmap

 - make tasks, sections and projects easily completeable
 - track progress of tasks etc in a User profile model
 - add tippy JS tooltip library; add ellipses to _task partial with buttons for edit/delete inside tooltip
 - add minimodal JS modal library; replace forms with separate views with modals
 - improve UX
 - add controller and views for info pages; welcome, about, contact, etc.
 - make navbar and sidebar mobile toggles work
 - add stimulusJS and stimulus tailwind stuff
 - add bold font
 - reorganize views to not reuse so many containers, esp the various forms

## Built with

Frontend: TailwindCSS v2.2(StimulusJS coming soon)  
Backend: Ruby on Rails v6.1.4  
  Ruby Gems: Devise, Simple_Forms, Better_Errors  
Database: PostgreSQL  