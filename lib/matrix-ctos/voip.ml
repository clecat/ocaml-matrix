open Json_encoding

module Query = Empty.Query

let path = "/_matrix/client/r0/voip/turnServer"

module Response =
struct
  type t = (* Should all be required, but tldr: anwser can be null and `option` didnt work *)
    { username: string option
    ; password: string option
    ; uris: string list option
    ; ttl: int option
    } [@@deriving accessor]

  let encoding =
    let to_tuple t =
      t.username, t.password, t.uris, t.ttl
    in
    let of_tuple v =
      let username, password, uris, ttl = v in
      { username; password; uris; ttl }
    in
    let with_tuple =
      obj4
        (opt "username" string)
        (opt "password" string)
        (opt "uris" (list string))
        (opt "ttl" int)
    in
    conv to_tuple of_tuple with_tuple
end

let needs_auth = true