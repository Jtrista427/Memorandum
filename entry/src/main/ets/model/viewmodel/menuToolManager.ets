import { MenuHeaderType, HeaderListType } from '../../constant/MenuHeaderData'
import { MemoMenuItem } from '../MemoMenuItem'
import { ObservedArray } from '../observedArray'
import { mViewModel } from './mViewModel'
import { menuHeaderData, contentHeaderReadData, contentHeaderEditData, } from '../../constant/MenuHeaderData'

@Observed
export class MenuToolManager {
  mViewModel: mViewModel | undefined
  menuToolMap: Map<number, MemoMenuItem> = new Map()
  headerData: ObservedArray<MemoMenuItem> = new ObservedArray()
  editMenuData: ObservedArray<MemoMenuItem> = new ObservedArray()
  readMenuData: ObservedArray<MemoMenuItem> = new ObservedArray()

  constructor() {
    this.headerData = this.initMenuData(menuHeaderData)
    this.editMenuData = this.initMenuData(contentHeaderEditData)
    this.readMenuData = this.initMenuData(contentHeaderReadData)
  }

  init(mViewModel: mViewModel) {
    this.mViewModel = mViewModel
  }

  initMenuData(initData: MenuHeaderType[]) {
    const menuData: ObservedArray<MemoMenuItem> = new ObservedArray()
    initData.forEach((item) => {
      const data = new MemoMenuItem(item)
      data.onClick = this.handleMenuClick(item.id)
      data.updateActive = this.handleMenuActive(item.id)
      menuData.push(data)
      this.menuToolMap.set(item.id, data)
    })
    return menuData
  }

  handleMenuClick(id: number): () => void {
    return () => {
      if (this.mViewModel) {
        switch (id) {
          case HeaderListType.NEW_FILE:
            this.mViewModel.newMemo()
            break
          case HeaderListType.SAVE:
            this.mViewModel.newMemo()
        }
      }
    }
  }

  handleMenuActive(id: number): () => void {
    return () => {
      if (this.mViewModel) {
        switch (id) {
          case HeaderListType.NEW_FILE:
            if (this.mViewModel.isNewFile) {
              this.menuToolMap.get(id)!.isActive = false
            }
            break
          default:

        }
      }
    }
  }
}