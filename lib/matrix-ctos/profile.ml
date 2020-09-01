open Json_encoding

module Display_name =
struct
  module Set =
  struct
    module Query = Empty.Query

    let path user_id= "_matrix/client/r0/profile/" ^ user_id ^ "/displayname"

    module Request =
    struct
      type t =
        { displayname: string option
        } [@@deriving accessor]

      let encoding =
        let to_tuple t =
          t.displayname
        in
        let of_tuple v =
          let displayname = v in
          {displayname}
        in
        let with_tuple =
          obj1
            (opt "displayname"
              string)
        in
        conv to_tuple of_tuple with_tuple
    end

    module Response = Empty.Json

    let needs_auth = true
  end

  module Get =
  struct
    module Query = Empty.Query

    let path user_id = "_matrix/client/r0/profile/" ^ user_id ^ "/displayname"

    module Response =
    struct
      type t =
        { displayname: string option
        } [@@deriving accessor]

      let encoding =
        let to_tuple t =
          t.displayname
        in
        let of_tuple v =
          let displayname = v in
          {displayname}
        in
        let with_tuple =
          obj1
            (opt "displayname"
              string)
        in
        conv to_tuple of_tuple with_tuple
    end

    let needs_auth = false
  end
end

module Avatar_url =
struct
  module Set =
  struct
    module Query = Empty.Query

    let path user_id= "_matrix/client/r0/profile/" ^ user_id ^ "/avatar_url"

    module Request =
    struct
      type t =
        { avatar_url: string option
        } [@@deriving accessor]

      let encoding =
        let to_tuple t =
          t.avatar_url
        in
        let of_tuple v =
          let avatar_url = v in
          {avatar_url}
        in
        let with_tuple =
          obj1
            (opt "avatar_url"
              string)
        in
        conv to_tuple of_tuple with_tuple
    end

    module Response = Empty.Json

    let needs_auth = true
  end

  module Get =
  struct
    module Query = Empty.Query

    let path user_id= "_matrix/client/r0/profile/" ^ user_id ^ "/avatar_url"

    module Response =
    struct
      type t =
        { avatar_url: string option
        } [@@deriving accessor]

      let encoding =
        let to_tuple t =
          t.avatar_url
        in
        let of_tuple v =
          let avatar_url = v in
          {avatar_url}
        in
        let with_tuple =
          obj1
            (opt "avatar_url"
              string)
        in
        conv to_tuple of_tuple with_tuple
    end

    let needs_auth = false
  end
end

module Get =
struct
  module Query = Empty.Query

  let path user_id= "_matrix/client/r0/profile/" ^ user_id

  module Response =
  struct
    type t =
      { displayname: string option
      ; avatar_url: string option
      } [@@deriving accessor]

    let encoding =
      let to_tuple t =
        t.displayname, t.avatar_url
      in
      let of_tuple v =
        let displayname, avatar_url = v in
        {displayname; avatar_url}
      in
      let with_tuple =
        obj2
          (opt "displayname"
            string)
          (opt "avatar_url"
            string)
      in
      conv to_tuple of_tuple with_tuple
  end

  let needs_auth = false
end