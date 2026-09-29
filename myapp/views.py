from django.http import HttpResponse

def home(request):
    return HttpResponse("<h1>Hello from Django Docker!</h1><p>My first Docker project is working.</p>")