<!-- Button to trigger modal -->
<button type="button" class="btn btn-link chat-icon mt-2" data-bs-toggle="modal"
        data-bs-target="#sendInvitationModal">
    <g:img dir="images" file="sendInvitation.svg" width="30" height="30"/>
</button>
<!-- Modal -->
<div class="modal fade" id="sendInvitationModal" tabindex="-1"
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
                <g:form>
                    <div class="mb-3">
                        <label for="userEmail" class="form-label">Email*:</label>
                        <input type="text" class="form-control" name="userEmail" id="userEmail">
                    </div>
                    <div class="mb-3">
                        <label for="shareTopic"  class="form-label">Topic*:</label>
                        <select class="form-select" name="invitedForTopic" id="shareTopic">
                            <option><a href="#">Topic1</a></option>
                            <option><a href="#">Topic2</a></option>
                        </select>
                    </div>
                    <!-- Modal Footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary">Invite</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>