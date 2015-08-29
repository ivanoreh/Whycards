function populate( list )
{
    for( var i = 0 ; i < 10; i++)
    {
        if( i%2 )
            list.append(
                        {
                            source: "../../assets/sombrero1.jpg",
                            text: "ovo je jedan dugacak text koji sluzi za zauzimanje mjesta"
                        } );

        else
            list.append(
                        {
                            source: "../../assets/sombrero2.jpeg",
                            text: "2 ovo je jedan dugacak text koji sluzi za zauzimanje mjesta"
                        } );

        if( i%4 )
            list.append(
                        {
                            source: "../../assets/sombrero3.jpg",
                            text: "3 ovo je jedan dugacak text koji sluzi za zauzimanje mjesta 2 ovo je jedan dugacak text koji sluzi za zauzimanje mjesta 2 ovo je jedan dugacak text koji sluzi za zauzimanje mjesta 2 ovo je jedan dugacak text koji sluzi za zauzimanje mjesta 2 ovo je jedan dugacak text koji sluzi za zauzimanje mjesta 2 ovo je jedan dugacak text koji sluzi za zauzimanje mjesta 2 ovo je jedan dugacak text koji sluzi za zauzimanje mjesta 2 ovo je jedan dugacak text koji sluzi za zauzimanje mjesta 2 ovo je jedan dugacak text koji sluzi za zauzimanje mjesta 2 ovo je jedan dugacak text koji sluzi za zauzimanje mjesta 2 ovo je jedan dugacak text koji sluzi za zauzimanje mjesta"
                        } );


    }
}

