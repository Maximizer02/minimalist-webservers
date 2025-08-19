use std::net::{TcpListener, TcpStream, SocketAddr};
use std::io::{Read,Write};

fn bind_listener(adress:&str, port:&str) -> TcpListener {
    let full_adress = format!("{adress}:{port}"); 
    println!("Binding on {full_adress}");
    TcpListener::bind(full_adress).unwrap()
}

fn accept_connection(listener:TcpListener) -> (TcpStream, SocketAddr){
    println!("Listening for incoming connections...");
    listener.accept().expect("kekw")
}

fn handle_connection(con_info:(TcpStream, SocketAddr)){    
    let (mut stream, adress) = con_info;
    println!("Connected to: {adress}");

    let mut buffer :[u8;512] = [0;512];
    let length = stream.read(&mut buffer).unwrap();
    let buffer_string = str::from_utf8(&buffer).unwrap();
    println!("Request Length: {length}");
    println!("{buffer_string}");
    let response = 
        "HTTP/1.1 200 OK\r\ncontent-type: text/html\r\n\r\n<h1>Hello from Rust!</h1>\r\n".as_bytes();
    let _ = stream.write(response);
}

fn main(){
    let adress = "0.0.0.0";
    let port = "8080";
    loop{
        let listener = bind_listener(adress, port);
        let connection = accept_connection(listener);
        handle_connection(connection);
    }
}
