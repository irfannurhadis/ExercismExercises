pub type Tree(a) {
  Leaf
  Node(value: a, left: Tree(a), right: Tree(a))
}

type Breadcrumb(a) {
  LeftCrumb(value: a, right: Tree(a))
  RightCrumb(value: a, left: Tree(a))
}

pub opaque type Zipper(a) {
  Zipper(focus: Tree(a), crumbs: List(Breadcrumb(a)))
}

pub fn to_zipper(tree: Tree(a)) -> Zipper(a) {
  Zipper(tree, [])
}

fn up_all(zipper: Zipper(a)) -> Result(Zipper(a), Nil) {
  case up(zipper) {
    Ok(parent) -> up_all(parent)
    Error(Nil) -> Ok(zipper)
  }
}

pub fn to_tree(zipper: Zipper(a)) -> Tree(a) {
  case zipper.crumbs {
    [] -> zipper.focus
    _ -> { let assert Ok(root_zipper) = up_all(zipper)
         root_zipper.focus }
  }
}


pub fn value(zipper: Zipper(a)) -> Result(a, Nil) {
  case zipper.focus {
    Leaf -> Error(Nil)
    Node(v, _, _) -> Ok(v)
  }
}

pub fn up(zipper: Zipper(a)) -> Result(Zipper(a), Nil) {
  case zipper.crumbs {
    [] -> Error(Nil)
    [crumb, ..rest] -> {
      let new_focus = case crumb {
        LeftCrumb(v, right) -> Node(v, zipper.focus, right)
        RightCrumb(v, left) -> Node(v, left, zipper.focus)
      }
      Ok(Zipper(new_focus, rest))
    }
  }
}

pub fn left(zipper: Zipper(a)) -> Result(Zipper(a), Nil) {
  case zipper.focus {
    Leaf -> Error(Nil)
    Node(v, l, r) -> Ok(Zipper(l, [LeftCrumb(v, r) , ..zipper.crumbs]))
  }
}

pub fn right(zipper: Zipper(a)) -> Result(Zipper(a), Nil) {
    case zipper.focus {
    Leaf -> Error(Nil)
    Node(v, l, r) -> Ok(Zipper(r, [RightCrumb(v, l) , ..zipper.crumbs]))
  }

}

pub fn set_value(zipper: Zipper(a), value: a) -> Zipper(a) {
  case zipper.focus {
    Leaf -> zipper
    Node(_, l, r) -> Zipper(Node(value, l, r), zipper.crumbs)
  }
}

pub fn set_left(zipper: Zipper(a), tree: Tree(a)) -> Result(Zipper(a), Nil) {
  case zipper.focus {
    Leaf -> Error(Nil)
    Node(v, _, r) -> Ok(Zipper(Node(v, tree, r), zipper.crumbs))
  }
}

pub fn set_right(zipper: Zipper(a), tree: Tree(a)) -> Result(Zipper(a), Nil) {
  case zipper.focus {
    Leaf -> Error(Nil)
    Node(v, l, _) -> Ok(Zipper(Node(v, l, tree), zipper.crumbs))
  }
}
