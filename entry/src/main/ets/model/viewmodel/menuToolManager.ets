import { MenuHeaderType, HeaderListType } from '../../constant/MenuHeaderData'
import { MemoMenuItem } from '../MemoMenuItem'
import { mViewModel } from './mViewModel'

export class menuToolManager {
  mViewModel: mViewModel | undefined

  init(mViewModel: mViewModel) {
    this.mViewModel = mViewModel
  }

  initMenuData(initData: MenuHeaderType[]) {
    const menuData: MemoMenuItem[] = []
    initData.forEach((item) => {
      const data = new MemoMenuItem(item)
      data.onClick = this.handleMenuClick(item.id)
      menuData.push(data)
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
}