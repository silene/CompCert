(* *********************************************************************)
(*                                                                     *)
(*              The Compcert verified compiler                         *)
(*                                                                     *)
(*          Bernhard Schommer, AbsInt Angewandte Informatik GmbH       *)
(*                                                                     *)
(*  Copyright Institut National de Recherche en Informatique et en     *)
(*  Automatique.  All rights reserved.  This file is distributed       *)
(*  under the terms of the INRIA Non-Commercial License Agreement.     *)
(*                                                                     *)
(* *********************************************************************)

type t =
  | Label of int        (** label argument, used for current location*)
  | String of string    (** text part of the ais annotation *)
  | Symbol of AST.ident (** symbol argument, used in variable and function addresses *)

val add_ais_annot : int -> ('a -> string) -> string -> string -> 'a AST.builtin_arg list -> unit
(** [add_ais_annot lbl preg spreg txt args] adds the ais annotation [txt] were the format
    specifiers are replace according to their type:
    -a: area definitions
    -e: general expressions
    -l: l-value expressions
    -p: program location
    -here: the address of the ais annotation [lbl]
    and [preg] is used to get the names of the registers, as well as [spreg] the name of the
    stack pointer and [args] the arguments reference in the replacements
*)

val get_ais_annots: unit -> (t list) list
(** [get_ais_annots ()] return the list of all ais annotations and reset it *)
