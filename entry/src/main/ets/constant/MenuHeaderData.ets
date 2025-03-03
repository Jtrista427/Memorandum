import { DirectionType, MemoMenuItem } from '../model/MemoMenuItem'

export interface MenuHeaderType {
  id: HeaderListType
  direction: DirectionType
  defaultImageSrc: string | Resource
  changedImageSrc?: string | Resource
  isActive?: boolean
}

export enum HeaderListType {
  CONTROL = 0,
  NEW_FILE,
  DISPLAY,
  MORE_MENU,
  EXPAND,
  SHARE,
  STAR,
  DELETE,
  CONTENT_MORE_MENU,
  SAVE
}


export const menuHeaderData: MenuHeaderType[] = [{
  id: HeaderListType.CONTROL,
  direction: DirectionType.left,
  defaultImageSrc: $r('app.media.hide_menu'),
  changedImageSrc: $r('app.media.unfold_menu'),
  isActive: false
},
  {
    id: HeaderListType.NEW_FILE,
    direction: DirectionType.right,
    defaultImageSrc: $r('app.media.add_file'),
  },
  {
    id: HeaderListType.DISPLAY,
    direction: DirectionType.right,
    defaultImageSrc: $r('app.media.blocks'),
    changedImageSrc: $r('app.media.menu'),
    isActive: false
  },
  {
    id: HeaderListType.MORE_MENU,
    direction: DirectionType.right,
    defaultImageSrc: $r('app.media.more_menu'),
    isActive: false
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
    isActive: false
  },
  {
    id: HeaderListType.STAR,
    direction: DirectionType.right,
    defaultImageSrc: $r('app.media.star'),
    changedImageSrc: $r("app.media.yellow_star"),
    isActive: true
  },
  {
    id: HeaderListType.DELETE,
    direction: DirectionType.right,
    defaultImageSrc: $r('app.media.delete'),
    isActive: false
  },
  {
    id: HeaderListType.CONTENT_MORE_MENU,
    direction: DirectionType.right,
    defaultImageSrc: $r('app.media.more_menu'),
    isActive: false
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