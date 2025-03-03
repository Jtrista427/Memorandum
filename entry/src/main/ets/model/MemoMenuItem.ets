import { MenuHeaderType } from '../constant/MenuHeaderData'

export enum DirectionType {
  left = 0,
  right
}

@Observed
export class MemoMenuItem {
  id: number
  direction: DirectionType
  defaultImageSrc: string | Resource
  changedImageSrc?: string | Resource
  currentImageSrc: string | Resource
  isActive?: boolean = true
  onClick?: () => void
  updateActive?: () => void

  constructor(param: MenuHeaderType) {
    this.id = param.id
    this.direction = param.direction
    this.defaultImageSrc = param.defaultImageSrc
    this.changedImageSrc = param.changedImageSrc
    this.isActive = param.isActive ?? true
    this.currentImageSrc = this.defaultImageSrc
  }
}