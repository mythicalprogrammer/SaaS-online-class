class Class
 def attr_accessor_with_history(*attr_name)
  attr_name = attr_name.collect { |x| x.to_s }
  attr_name.each do |x|
   attr_reader x # create the attribute's getter
   attr_reader x+"_history" # create bar_history getter
  end

  class_eval do
   attr_name.each do |var|
    define_method( var+"=" ) do |val|
     instance_variable_set("@#{var}",val)
     instance_variable_set("@#{var}_history",[nil]) if instance_variable_get("@#{var}_history").nil?
     instance_variable_get("@#{var}_history") << val
    end
   end
  end
 end
end

class Foo
 attr_accessor_with_history :bar, :foo
end
(18:36:45) Ryan Kwong: 
its a lot shorter if you just want to take 1 argument
(18:36:55) savageretard: 
wtf
(18:36:56) savageretard: 
haha
(18:37:26) Ryan Kwong: 
Essentially the first collect is just to make all the arguments into strings
(18:37:40) Ryan Kwong: 
the second loop simply calls Rubys magic getter
(18:37:50) Ryan Kwong: 
Which he did in 1 lijne if you sue his code
(18:37:50) Ryan Kwong: 
used*
(18:37:58) Ryan Kwong: 
I just looped it for more than 1 argument
(18:37:58) Ryan Kwong: 
Nothing new
(18:38:06) savageretard: 
I thought we need some sort of datastructure
(18:38:06) Ryan Kwong: 
he just did attr_name = attr_name.to_s
(18:38:09) savageretard: 
to hold the history?
(18:38:19) savageretard: 
to_s is to string?
(18:38:20) Ryan Kwong: 
We are
(18:38:20) Ryan Kwong: 
Its an array
(18:38:25) Ryan Kwong: 
yes
(18:38:47) savageretard: 
which line of code is the array in?
(18:38:50) savageretard: 
[nil]?
(18:38:58) Ryan Kwong: 
yea
(18:39:01) Ryan Kwong: 
its basically saying
(18:39:09) Ryan Kwong: 
@bar_history = [nil]
(18:39:18) Ryan Kwong: 
where bar is the variable name
(18:39:30) Ryan Kwong: 
second one is simply
(18:39:33) Ryan Kwong: 
@bar_history << value
(18:39:38) savageretard: 
what's the << ?
(18:39:45) Ryan Kwong: 
array push
(18:39:48) savageretard: 
oh
(18:39:49) Ryan Kwong: 
you can do
(18:39:52) savageretard: 
I do .push
(18:39:58) Ryan Kwong: 
@bar_history.push value
18:40
(18:40:01) Ryan Kwong: 
i like <<
(18:40:07) savageretard: 
fuck that haha
(18:40:12) savageretard: 
I rather use something I can read
(18:40:22) Ryan Kwong: 
This calss eval define method is basically saying
(18:40:26) Ryan Kwong: 
for each stupid ass fucking shit
(18:40:30) Ryan Kwong: 
we define the setter
(18:40:38) Ryan Kwong: 
def var_name=(value) ... end
(18:40:43) Ryan Kwong: 
its just a fancy looking one thats dynamic
(18:40:55) Ryan Kwong: 
I mean if you break it down and destroy it its basically that
(18:41:07) savageretard: 
mmm kay
(18:41:11) savageretard: 
sleepah
(18:41:12) savageretard: 
fuck
(18:41:16) savageretard: 
spent the night on this
(18:41:25) Ryan Kwong: 
eh
(18:41:28) Ryan Kwong: 
i took a long time on it
(18:41:30) savageretard: 
read book, video and shit
(18:41:31) Ryan Kwong: 
to understand the errors
(18:41:31) Ryan Kwong: 
lol
(18:41:39) savageretard: 
naw I don't think I'll send the last part in
(18:41:46) savageretard: 
I'll spend my time some other time to do it
(18:42:08) savageretard: 
you finish the 2nd hw?
(18:42:54) Ryan Kwong: 
define_method( var+"=" ) do |val| # def foo=(other)
instance_variable_set("@#{var}",val) # @foo = other
instance_variable_set("@#{var}_history",[nil]) if instance_variable_get("@#{var}_history").nil? @foo_history = [nil] if it isn't set
instance_variable_get("@#{var}_history") << val # @foo_history << other
end
(18:43:05) Ryan Kwong: 
so basically its a setter dynamically
(18:43:09) Ryan Kwong: 
its essentially writing
(18:43:36) Ryan Kwong: 
def foo=(other)
  @foo = other
  @foo_history ||= []
  @foo_history << other
end
(18:43:49) Ryan Kwong: 
thats all it is o.o
(18:44:17) savageretard: 
what's the last two line?
(18:44:22) savageretard: 
  @foo_history ||= []
  @foo_history << other
(18:44:26) savageretard: 
oh history
(18:44:34) Ryan Kwong: 
the first one is
(18:44:37) savageretard: 
so you create the array?
(18:44:41) Ryan Kwong: 
Initializing foo_history if it isn't set to an array
(18:44:41) Ryan Kwong: 
Yea
(18:44:42) savageretard: 
and 2nd is you push it?
(18:44:45) savageretard: 
ah
(18:44:46) Ryan Kwong: 
Yep
(18:44:53) Ryan Kwong: 
its basically asying
(18:44:54) savageretard: 
how does it reset it?
(18:44:56) savageretard: 
when you do new?
18:45
(18:45:00) savageretard: 
because you create a new instance
(18:45:06) savageretard: 
it runs that line?
(18:45:10) savageretard: 
creating a new array?
(18:45:46) Ryan Kwong: 
What you mean rset it?
(18:45:53) Ryan Kwong: 
as in when you call new on ti?
(18:45:54) Ryan Kwong: 
it*
(18:46:13) savageretard: 
f = Foo.new
f.bar = 1
f.bar = 2
f = Foo.new
f. bar = 4
f.bar_history
(18:46:21) savageretard: 
when you do a second .new
(18:46:24) savageretard: 
it reset the history
(18:46:32) Ryan Kwong: 
oh
(18:46:36) savageretard: 
because it creates a new instance?
(18:46:42) Ryan Kwong: 
Basically
(18:46:42) savageretard: 
and the last instance was lost?
(18:46:58) Ryan Kwong: 
You're overwriting it essentially
(18:47:04) Ryan Kwong: 
Well Ruby cleans up memory leaks
(18:47:11) Ryan Kwong: 
When it sees that there is no reference to that object
(18:47:29) Ryan Kwong: 
So when you created a new instance and assigned it to f
(18:47:36) Ryan Kwong: 
you lost the assignment already to the previous object
(18:47:36) Ryan Kwong: 
its gone baby gone.
(18:47:40) Ryan Kwong: 
its gone home.
(18:47:40) Ryan Kwong: 
lol
(18:49:26) Ryan Kwong: 
Oh and when you create a new instance
(18:49:33) Ryan Kwong: 
It calls the attr_accessor_with_history for that instance
(18:49:43) Ryan Kwong: 
It gets created for that instance
(18:49:47) Ryan Kwong: 
I think he mentioned it because
(18:49:50) Ryan Kwong: 
He didnt' want you to make a static variable
(18:49:54) Ryan Kwong: 
Probably thats the reasonc
18:50
(18:50:01) Ryan Kwong: 
I didn't even have to consider thinking it would keep the old history
(18:50:08) Ryan Kwong: 
Because its an instance of the object
(18:50:18) Ryan Kwong: 
I guess he didn't want people making @@history
(18:50:18) Ryan Kwong: 
lol
(18:50:56) Ryan Kwong: 
History of instance variables should be maintained separately for each object
instance.


