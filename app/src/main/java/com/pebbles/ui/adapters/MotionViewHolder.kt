package com.pebbles.ui.adapters

import android.view.View
import android.widget.ImageButton
import android.widget.ImageView
import androidx.constraintlayout.motion.widget.MotionLayout
import androidx.recyclerview.widget.RecyclerView
import com.pebbles.R
import com.pebbles.core.assignImageFromUrl

class MotionViewHolder  (itemView: View) : RecyclerView.ViewHolder(itemView) {
    private val motionLayout: MotionLayout = itemView.findViewById(R.id.motionLayout)
    private val profileImageView: ImageView = itemView.findViewById(R.id.profileImageView)

    fun bindTo(dataHolder: MotionDataHolder, deviceListClickListener: CommonListAdapter.DeviceListClickListener) {

        profileImageView.assignImageFromUrl(dataHolder.user.profilePhotoUrl, isCircleCrop = true)

        profileImageView.setOnClickListener {
            motionLayout.progress = 0f
            motionLayout.setTransition(R.id.likeTransition)
            motionLayout.transitionToEnd()
        }

    }
}