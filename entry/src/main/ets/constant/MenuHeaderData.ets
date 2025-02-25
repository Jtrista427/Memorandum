export interface MenuHeaderType {
  id: number
  direction: DirectionType
  defaultImageSrc: string | Resource
  changedImageSrc?: string | Resource
}

export enum HeaderListType {
  CONTROL = 0,
  NEWFILE,
  DISPLAY,
  MOREMENU,
  EXPAND,
  SHARE,
  STAR,
  DELETE,
  CONTENT_MOREMENU,
  SAVE
}

export enum DirectionType {
  left = 0,
  right
}

export const menuHeaderData: MenuHeaderType[] = [{
  id: HeaderListType.CONTROL,
  direction: DirectionType.left,
  defaultImageSrc: $r('app.media.hide_menu'),
  changedImageSrc: $r('app.media.unfold_menu'),
},
  {
    id: HeaderListType.NEWFILE,
    direction: DirectionType.right,
    defaultImageSrc: $r('app.media.add_file'),
  },
  {
    id: HeaderListType.DISPLAY,
    direction: DirectionType.right,
    defaultImageSrc: $r('app.media.blocks'),
    changedImageSrc: $r('app.media.menu'),
  },
  {
    id: HeaderListType.MOREMENU,
    direction: DirectionType.right,
    defaultImageSrc: $r('app.media.more_menu'),
  },
]

export const contentHeaderReadData: MenuHeaderType[] = [{
  id: HeaderListType.EXPAND,
  direction: DirectionType.left,
  defaultImageSrc: $r('app.media.fold'),
  changedImageSrc: $r('app.media.unfold'),
},
  {
    id: HeaderListType.SHARE,
    direction: DirectionType.right,
    defaultImageSrc: $r('app.media.share'),
  },
  {
    id: HeaderListType.STAR,
    direction: DirectionType.right,
    defaultImageSrc: $r('app.media.star'),
    changedImageSrc: $r("app.media.yellow_star"),
  },
  {
    id: HeaderListType.DELETE,
    direction: DirectionType.right,
    defaultImageSrc: $r('app.media.delete'),
  },
  {
    id: HeaderListType.CONTENT_MOREMENU,
    direction: DirectionType.right,
    defaultImageSrc: $r('app.media.more_menu'),
  },
]

export const contentHeaderEditData: MenuHeaderType[] = [{
  id: HeaderListType.EXPAND,
  direction: DirectionType.left,
  defaultImageSrc: $r('app.media.fold'),
  changedImageSrc: $r('app.media.unfold'),
},
  {
    id: HeaderListType.SAVE,
    direction: DirectionType.right,
    defaultImageSrc: $r('app.media.save'),
  },
]