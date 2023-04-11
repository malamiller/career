if [ sudo mysql -e 'use career_search']
then
    echo "database does not exist"
    sudo mysql < career_search.sql
else
    echo "database already exist"
fi
