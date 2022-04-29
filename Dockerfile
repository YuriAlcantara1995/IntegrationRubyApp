FROM ruby:2

RUN gem install sinatra -v1.4.8

COPY main.rb /

CMD ["ruby","main.rb"]  
