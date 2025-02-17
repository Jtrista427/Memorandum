export interface MenuHeaderType {
  id: number
  direction: DirectionType
  defaultImageSrc: string | Resource
  changedImageSrc?: string | Resource
}

export enum HeaderListType {
  CONTROL = 0,
  NEWFILE,
  DISPALY,
  MOREMENU,
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
    id: HeaderListType.DISPALY,
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