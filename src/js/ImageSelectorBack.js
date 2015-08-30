
function getData( dir, list )
{
    var files = fileService.getDir( dir );

    list.clear();

    for( var i in files )
    {
        //console.log( i, files[i])
        list.append(
                    {
                        type: files[i],
                        url: i
                    }
                    );
    }
}



