
<!-- Modal -->
<div class="modal fade" id="sendInvitationModal_${subsData.topic.id}" tabindex="-1"
     aria-labelledby="sendInvitationModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="modal-title" id="sendInvitationModalLabel">Send Invitation</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <!-- Modal Body -->
            <div class="modal-body">
                <g:form controller="DashboardAccess" action="sendInvitation">
                    <div class="mb-3">
                        <label for="inviteEmail" class="form-label">Email*:</label>
                        <input type="text" class="form-control" name="inviteEmail" id="inviteEmail">
                    </div>
                    <div class="form-group">
                        <label >Topic*</label>
                        <input type="text" name="inviteToTopic" id="inviteToTopic" value="${subsData.topic.name}"  required="true" class="form-control" disabled="true"/>
                        <input type="text" name="inviteToTopic" id="inviteToTopicHidden" value="${subsData.topic.id}"  required="true" class="form-control" hidden="true"/>
                    </div>
                    <!-- Modal Footer -->
                    <div class="modal-footer">
                        <g:submitButton name="Invite" class="btn btn-primary">Invite</g:submitButton>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>